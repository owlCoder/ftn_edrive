const admin = require('../firebaseConfig');

const getRoles = async (uid) => {
    try {
      const userRef = admin.firestore().collection('roles');
      const usersSnapshot = await userRef.get();
      const rolesData = [];
  
      usersSnapshot.forEach((doc) => {
        rolesData.push(doc.id);
      });
      
      await admin.firestore().collection("audits").add({
        messageType: "INFO",
        message: "User (uid: " + uid + ") has been accessed to collection 'roles'",
        date: admin.firestore.FieldValue.serverTimestamp(),
      });

      return { code: 200, payload: rolesData };
    } catch (error) {
      await admin.firestore().collection("audits").add({
        messageType: "ERROR",
        message: error.message,
        date: admin.firestore.FieldValue.serverTimestamp(),
      });
      return { code: 500, payload: "Internal Server Error" };
    }
  };

module.exports = { getRoles };