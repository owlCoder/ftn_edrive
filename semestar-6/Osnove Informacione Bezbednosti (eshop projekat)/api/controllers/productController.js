const admin = require('../firebaseConfig');

const getProducts = async () => {
  try {
    const productRef = admin.firestore().collection('products');
    const productSnapshot = await productRef.get();
    const productData = [];

    productSnapshot.forEach((doc) => {
      productData.push(doc.data());
    });

    return { code: 200, payload: productData };
  } catch (error) {
    await admin.firestore().collection("audits").add({
      messageType: "ERROR",
      message: error.message,
      date: admin.firestore.FieldValue.serverTimestamp(),
    });
    return { code: 500, payload: "Internal Server Error" };
  }
};

const getProductsPerSeller = async (uid) => {
  try {
    const productRef = admin.firestore().collection('products').where("sellerUid", "==", uid);
    const productSnapshot = await productRef.get();
    const productData = [];

    productSnapshot.forEach((doc) => {
      productData.push(doc.data());
    });      

    return { code: 200, payload: productData };
  } catch (error) {
    await admin.firestore().collection("audits").add({
      messageType: "ERROR",
      message: error.message,
      date: admin.firestore.FieldValue.serverTimestamp(),
    });
    return { code: 500, payload: "Internal Server Error" };
  }
};


const createProduct = async (data) => {
  try {
    const productRef = await admin.firestore().collection("products").add(
      {
        author: data.author,
        dateValidity: data.dateValidity,
        genres: data.genres,
        name: data.name,
        photoBase64: data.photoBase64,
        price: data.price,
        productionYear: data.productionYear,
        quantity: data.quantity,
        sellerUid: data.sellerUid,
        used: data.used,
      }
    );

    await productRef.update({ uid: productRef.id });

    await admin.firestore().collection("audits").add(
      {
        messageType: "INFO",
        message: "New product [name: " + data.name + "] is added to the system",
        date: admin.firestore.FieldValue.serverTimestamp(),
      }
    );

    return { code: 200, payload: "Product has been created" };
  } catch (error) {
    await admin.firestore().collection("audits").add({
      messageType: "ERROR",
      message: "Product [name: " + data.name + "] couldn't be added to the system [" + `${error.message}` + "]",
      date: admin.firestore.FieldValue.serverTimestamp(),
    }
    );
    return { code: 400, payload: "Product can't be created" };
  }
};

const updateProduct = async (data) => {
  try {
    await admin.firestore().collection("products").doc(data.uid).update(data);
    await admin.firestore().collection("audits").add(
      {
        messageType: "INFO",
        message: "Product [name: " + data.name + "] has been updated in the system",
        date: admin.firestore.FieldValue.serverTimestamp(),
      }
    );

    return { code: 200, payload: "Product has been updated" };
  } catch (error) {
    await admin.firestore().collection("audits").add({
      messageType: "ERROR",
      message: "Product [name: " + data.name + "] couldn't be updated in the system [" + `${error.message}` + "]",
      date: admin.firestore.FieldValue.serverTimestamp(),
    }
    );
    return { code: 400, payload: "Product can't be updated" };
  }
};

const deleteProduct = async (uid) => {
  try {
    // Delete the product directly by its UID
    await admin.firestore().collection("products").doc(uid).delete();

    // Add audit log for the deletion action
    await admin.firestore().collection("audits").add({
      messageType: "INFO",
      message: `Product [uid: ${uid}] has been deleted from the system`,
      date: admin.firestore.FieldValue.serverTimestamp(),
    });

    return { code: 200, payload: "Product has been deleted" };
  } catch (error) {
    await admin.firestore().collection("audits").add({
      messageType: "ERROR",
      message: `Product [UID: ${uid}] couldn't be deleted from the system [${error.message}]`,
      date: admin.firestore.FieldValue.serverTimestamp(),
    });
    return { code: 400, payload: "Product couldn't be deleted" };
  }
};

module.exports = { getProducts, createProduct, getProductsPerSeller, updateProduct, deleteProduct };