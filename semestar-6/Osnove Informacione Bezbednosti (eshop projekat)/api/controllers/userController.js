const admin = require('../firebaseConfig');

const createUser = async (data) => {
  try {
    await admin.firestore().collection("users").doc(data.uid).set(
      {
        uid: data.uid,
        email: data.email,
        firstName: data.firstName,
        lastName: data.lastName,
        date: data.date,
        photoBase64: `data:image/png;base64,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`,
        role: "user",
        disabled: false
      }
    );

    await admin.firestore().collection("audits").add({
      messageType: "INFO",
      message: "User [email: " + data.email + "] is now registered in system",
      date: admin.firestore.FieldValue.serverTimestamp(),
    }
    );

    return { code: 200, payload: "User has been created" };
  } catch (error) {
    await admin.firestore().collection("audits").add({
      messageType: "ERROR",
      message: "User [email: " + data.email + "] couldn't be registed in system [" + `${error.message}` + "]",
      date: admin.firestore.FieldValue.serverTimestamp(),
    }
    );
    return { code: 400, payload: "User can't be created" };
  }
};

const getUserByUid = async (uid) => {
  try {
    const userRef = admin.firestore().collection('users').doc(uid);
    const userDoc = await userRef.get();

    if (!userDoc.exists) {
      return { code: 404, payload: 'User not found' };
    } else {
      const userData = userDoc.data();
      return { code: 200, payload: userData };
    }
  } catch (error) {
    return { code: 500, payload: "Internal Server Error" };
  }
};

const getUsers = async (uid) => {
  try {
    const userRef = admin.firestore().collection('users');
    const usersSnapshot = await userRef.get();
    const usersData = [];

    usersSnapshot.forEach((doc) => {
      usersData.push(doc.data());
    });

    await admin.firestore().collection("audits").add({
      messageType: "INFO",
      message: "Administrator (uid: " + uid + ") has been accessed to users collection",
      date: admin.firestore.FieldValue.serverTimestamp(),
    });

    return { code: 200, payload: usersData };
  } catch (error) {
    await admin.firestore().collection("audits").add({
      messageType: "ERROR",
      message: error.message,
      date: admin.firestore.FieldValue.serverTimestamp(),
    });
    return { code: 500, payload: "Internal Server Error" };
  }
};

const updateProfilePicture = async (uid, base64) => {
  try {
    const docRef = admin.firestore().collection('users').doc(uid);
    const userDoc = await docRef.get();

    if (!userDoc.exists) {
      return { code: 404, payload: 'User not found' };
    } else {
      docRef
        .update({ photoBase64: base64 })
        .then(() => {
          return { code: 200, payload: "OK" };
        })
        .catch((error) => {
          return { code: 400, payload: "Profile picture can not be updated. Try again later!" };
        });
    }
  } catch (error) {
    return { code: 500, payload: "Internal Server Error" };
  }
};

const updateUser = async (uid, firstName, lastName, date) => {
  try {
    const docRef = admin.firestore().collection('users').doc(uid);
    const userDoc = await docRef.get();

    if (!userDoc.exists) {
      return { code: 404, payload: 'User not found' };
    } else {
      docRef
        .update({ firstName: firstName, lastName: lastName, date: date })
        .then(() => {
          return { code: 200, payload: "OK" };
        })
        .catch((error) => {
          return { code: 400, payload: "Profile data can't be updated. Try again later!" };
        });
    }
  } catch (error) {
    await admin.firestore().collection("audits").add({
      messageType: "ERROR",
      message: error.message,
      date: admin.firestore.FieldValue.serverTimestamp(),
    });
    return { code: 500, payload: "Internal Server Error" };
  }
};

const updateUserAdmin = async (data) => {
  try {
    const docRef = admin.firestore().collection('users').doc(data.uid);
    const userDoc = await docRef.get();

    if (!userDoc.exists) {
      return { code: 404, payload: 'User not found' };
    } else {
      docRef
        .update({ firstName: data.firstName, lastName: data.lastName, date: data.date, role: data.role, disabled: data.disabled, photoBase64: data.photoBase64 })
        .then(() => {

          // Change the user's account
          admin.auth().updateUser(data.uid, {
            disabled: data.disabled,
          });
          return { code: 200, payload: "OK" };
        })
        .catch((error) => {
          return { code: 400, payload: "Profile data can't be updated. Try again later!" };
        });
    }
  } catch (error) {
    await admin.firestore().collection("audits").add({
      messageType: "ERROR",
      message: error.message,
      date: admin.firestore.FieldValue.serverTimestamp(),
    });
    return { code: 500, payload: "Internal Server Error" };
  }
};

const deleteUser = async (uid) => {
  try {
    const userRef = admin.firestore().collection('users').doc(uid);
    const userDoc = await userRef.get();

    if (!userDoc.exists) {
      return { code: 404, payload: 'User not found' };
    } else {
      await userRef.delete(); // delete user in firestore
      await admin.auth().deleteUser(uid); // delete user in auth collection
      await admin.firestore().collection("audits").add({
        messageType: "INFO",
        message: "User account (uid: " + uid + ") has been deleted",
        date: admin.firestore.FieldValue.serverTimestamp(),
      });
      return { code: 200, payload: userData };
    }
  } catch (error) {
    await admin.firestore().collection("audits").add({
      messageType: "ERROR",
      message: error.message,
      date: admin.firestore.FieldValue.serverTimestamp(),
    });
    return { code: 500, payload: "Internal Server Error" };
  }
};

module.exports = { createUser, getUserByUid, getUsers, updateProfilePicture, updateUser, updateUserAdmin, deleteUser };