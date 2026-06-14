const admin = require('../firebaseConfig');

const createOrder = async (buyerUid, buyQuantity, product) => {
    try {
        // check if product has enought quantity
        const productRef = admin.firestore().collection("products").doc(product.uid);
        const availableProductQuantity = await productRef.get();
       
        if (parseInt(availableProductQuantity.data().quantity) < parseInt(buyQuantity)) {
            await admin.firestore().collection("audits").add(
                {
                  messageType: "WARNING",
                  message: "Order product quantity (" + availableProductQuantity.data().quantity + 
                           " pc/s) was lower then buyer [uid: " + buyerUid + "] requested (" + product.quantity + " pc/s)",
                  date: admin.firestore.FieldValue.serverTimestamp(),
                }
              );

            return { code: 400, payload: "Order can't be created" };
        }

        const orderRef = await admin.firestore().collection("orders").add({
            buyerUid: buyerUid,
            buyQuantity: buyQuantity,
            product: product,
            orderDate: admin.firestore.FieldValue.serverTimestamp(),
            total: parseFloat(buyQuantity) * parseFloat(availableProductQuantity.data().price)
        });

        await productRef.update({ quantity: parseInt(availableProductQuantity.data().quantity) - parseInt(buyQuantity) });
        
        await admin.firestore().collection("audits").add(
            {
              messageType: "INFO",
              message: "Order [uid: " + orderRef.id + "] has been added to the system by buyer [uid: " + buyerUid + "]",
              date: admin.firestore.FieldValue.serverTimestamp(),
            }
          );

        return { code: 201, payload: "Order has been created" };
    } catch (error) {
        console.log(error)
        return { code: 400, payload: "Order can't be created" };
    }
};

const readOrderPerUser = async (buyerUid) => {
    try {
        const orderRef = admin.firestore().collection('orders').where("buyerUid", "==", buyerUid);
        const ordersSnapshot = await orderRef.get();
        const ordersData = [];

        ordersSnapshot.forEach((doc) => {
            ordersData.push(doc.data());
        });

        return { code: 200, payload: ordersData };
    } catch (error) {
        return { code: 500, payload: "Internal Server Error" };
    }
};

const readAllOrders = async () => {
    try {
        const orderRef = admin.firestore().collection('orders');
        const ordersSnapshot = await orderRef.get();
        const ordersData = [];

        ordersSnapshot.forEach((doc) => {
            ordersData.push(doc.data());
        });

        return { code: 200, payload: ordersData };
    } catch (error) {
        return { code: 500, payload: "Internal Server Error" };
    }
};

module.exports = { createOrder, readOrderPerUser, readAllOrders };