const admin = require('../firebaseConfig');

const PERMISSIONS = { READ: 1, WRITE: 2, UPDATE: 3, DELETE: 4 };

const checkRole = async (role, collectionName, reqPerm) => {
    // WM FLAG CHECHKER
    if(global.WM === "WM_UNRESTRICTED")
        return true;

    try {
        const doc = await admin.firestore().collection('roles').doc(role).get();

        if (doc.exists) {
            const data = doc.data();
            const requiredPermission = PERMISSIONS[reqPerm.toUpperCase()];
            const permArray = data[collectionName.toLowerCase()];

            if (permArray.includes(requiredPermission)) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    } catch (error) {
        return false;
    }
};

const getUserRole = async (uid) => {
     // WM FLAG CHECHKER
     if(global.WM === "WM_UNRESTRICTED")
        return "admin";

    try {
        const userDoc = await admin.firestore().collection('users').doc(uid).get();

        if (userDoc.exists) {
            const userData = userDoc.data();
            const userRole = userData.role;
            return userRole;
        } else {
            return null; // User not found or user has no role field
        }
    } catch (error) {
        return null; // An error occurred
    }
};

module.exports = { checkRole, getUserRole };