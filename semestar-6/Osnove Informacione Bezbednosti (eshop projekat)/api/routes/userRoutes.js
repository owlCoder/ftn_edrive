const { verifyToken } = require('../middleware/verify');
const express = require('express');
const router = express.Router();
const users = require('../controllers/userController');
const { checkRole, getUserRole } = require('../middleware/role');
const admin = require('../firebaseConfig');

// Method to check uids validaty
function Check(uid, auth_uid) {
  // WM FLAG CHECHKER
  if(global.WM === "WM_UNRESTRICTED")
    return 200;

  // Check if the request contains the 'uid' field in the body
  if (!uid) return 400;

  // Check if the authenticated user matches the requested user's UID
  if (uid !== auth_uid) return 401;

  return 200; // uids are fine
}

// User route to create a new user
router.post('/create', verifyToken, async (req, res) => {
  const auth_uid = req.user.uid; // property access
  const { uid, email, firstName, lastName, date, u_role } = req.body;
  const reqData = { uid: uid, email: email, firstName: firstName, lastName: lastName, date: date, role: "user" };

  if (Check(uid, auth_uid) !== 200)
    return res.status(400).json({ code: 400, payload: "Invalid request body" });

  // RBAC
  let role = u_role ? await getUserRole(uid) : reqData.role;

  if (role == null) {
    return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
  }

  let reqs = await checkRole(role, "users", "write");
  if (reqs === false) {
    return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
  }
  // END OF RBAC

  // Call controller method to create an user
  let data = await users.createUser(reqData);
  return res.status(data.code).json({ code: data.code, payload: data.payload });
});

// Admin route to create a new user in FIREBASE AUTH base & FireStore base
router.post('/newAccount', verifyToken, async (req, res) => {
  const { uid, userProperties, userData } = req.body;

  // RBAC
  let role = await getUserRole(uid);

  if (role == null) {
    return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
  }

  let reqs = await checkRole(role, "users", "write");
  if (reqs === false) {
    return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
  }
  // END OF RBAC

  try {
    // create user in firebase auth db
    const userRecord = await admin.auth().createUser(userProperties);
    userData.uid = userRecord.uid; // save new user uid

    // Call controller method to create an user
    let data = await users.createUser(userData);
    return res.status(data.code).json({ code: data.code, payload: data.payload });
  }
  catch (error) {
    return res.status(400).json({ code: 400, payload: error.message });
  }
});

// User route to get user by UID
router.post('/getById', verifyToken, async (req, res) => {
  const auth_uid = req.user.uid; // property access
  const { uid } = req.body;

  if (Check(uid, auth_uid) !== 200)
    return res.status(400).json({ code: 400, payload: "Invalid request body" });

  // RBAC
  let role = await getUserRole(uid);

  if (role == null) {
    return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
  }

  let reqs = await checkRole(role, "users", "read");
  if (reqs === false) {
    return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
  }
  // END OF RBAC

  // Call controller method for user data fetch
  let data = await users.getUserByUid(uid);
  return res.status(200).json(data);
});

// User route to get user ROLE by UID
router.post('/getRoleByUid', verifyToken, async (req, res) => {
  const auth_uid = req.user.uid; // property access
  const { uid } = req.body;

  if (Check(uid, auth_uid) !== 200)
    return res.status(400).json({ code: 400, payload: "Invalid request body" });

  // RBAC
  let role = await getUserRole(uid);

  if (role == null) {
    return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
  }

  let reqs = await checkRole(role, "users", "read");
  if (reqs === false) {
    return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
  }
  else
    // END OF RBAC

    // Call controller method for user data fetch
    return res.status(200).json({ code: 200, payload: role });
});

// User route to get all users
router.post('/get', verifyToken, async (req, res) => {
  const { uid } = req.body;

  // RBAC
  let role = await getUserRole(uid);

  if (role == null || role != "admin") {
    return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
  }

  let reqs = await checkRole(role, "users", "read");
  if (reqs === false) {
    return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
  }
  // END OF RBAC

  // Call controller method for users data fetch
  let data = await users.getUsers(uid);
  return res.status(200).json(data);
});

// Update user profile picture
router.post('/updatePicture', verifyToken, async (req, res) => {
  const auth_uid = req.user.uid; // property access
  const { uid } = req.body;
  const { photoBase64 } = req.body;

  // Check if the request contains the 'uid' field in the body
  if (!uid) {
    return res.status(400).json({ code: data.code, payload: "Missing 'uid' field in the request body." });
  }

  // Check if the authenticated user matches the requested user's UID
  if (uid !== auth_uid) {
    return res.status(403).json({ code: data.code, payload: "Unauthorized." });
  }

  // RBAC
  let role = await getUserRole(uid);

  if (role == null) {
    return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
  }

  let reqs = await checkRole(role, "users", "update");
  if (reqs === false) {
    return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
  }
  // END OF RBAC

  // Call controller method for user data fetch
  try {
    let data = await users.updateProfilePicture(uid, photoBase64);
    return res.status(200).json(data);
  }
  catch (error) {
    return res.status(401).json({ code: data.code, payload: error });
  }
});

// Update user profile
router.post('/update', verifyToken, async (req, res) => {
  const auth_uid = req.user.uid; // property access
  const { uid } = req.body;
  const { firstName, lastName, date } = req.body;

  // Check if the request contains the 'uid' field in the body
  if (!uid) {
    return res.status(400).json({ code: 400, payload: "Missing 'uid' field in the request body." });
  }

  // Check if the authenticated user matches the requested user's UID
  if (uid !== auth_uid) {
    return res.status(403).json({ code: 403, payload: "Unauthorized." });
  }

  // RBAC
  let role = await getUserRole(uid);

  if (role == null) {
    return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
  }

  let reqs = await checkRole(role, "users", "update");
  if (reqs === false) {
    return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
  }
  // END OF RBAC

  // Call controller method for user data fetch
  try {
    let data = await users.updateUser(uid, firstName, lastName, date);
    return res.status(200).json(data);
  }
  catch (error) {
    return res.status(401).json({ code: data.code, payload: error });
  }
});

// Update user profile by an admin
router.post('/update/admin', verifyToken, async (req, res) => {
  const { uid, data } = req.body;

  // Check if the request contains the 'uid' field in the body
  if (!uid) {
    return res.status(400).json({ code: 400, payload: "Missing 'uid' field in the request body." });
  }

  // RBAC
  let role = await getUserRole(uid);

  if (role == null) {
    return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
  }

  let reqs = await checkRole(role, "users", "update");
  if (reqs === false) {
    return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
  }
  // END OF RBAC

  // Call controller method for user data fetch
  try {
    let response = await users.updateUserAdmin(data);
    return res.status(200).json(response);
  }
  catch (error) {
    return res.status(401).json({ code: data.code, payload: error });
  }
});

// Delete user account
router.post('/delete', verifyToken, async (req, res) => {
  const auth_uid = req.user.uid; // property access
  const { uid } = req.body;

  if(global.WM === "WM_UNRESTRICTED") {
    // delete user
    try {
      let data = await users.deleteUser(uid);
      return res.status(200).json(data);
    }
    catch (error) {
      return res.status(401).json({ code: data.code, payload: error });
    }
  }

  // Check if the request contains the 'uid' field in the body
  if (!uid) {
    return res.status(400).json({ code: data.code, payload: "Missing 'uid' field in the request body." });
  }

  // Check if the authenticated user matches the requested user's UID
  if (uid !== auth_uid) {
    return res.status(403).json({ code: 403, payload: "Unauthorized." });
  }

  // RBAC
  let role = await getUserRole(uid);

  if (role == null) {
    return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
  }

  let reqs = await checkRole(role, "users", "delete");
  if (reqs === false) {
    return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
  }
  // END OF RBAC

  // Call controller method for user data fetch
  try {
    let data = await users.deleteUser(uid);
    return res.status(200).json(data);
  }
  catch (error) {
    return res.status(401).json({ code: data.code, payload: error });
  }
});

// Delete user account by an admin
router.post('/delete/guid', verifyToken, async (req, res) => {
  const auth_uid = req.user.uid; // property access
  const { uid } = req.body;

  // Check if the request contains the 'uid' field in the body
  if (!uid) {
    return res.status(400).json({ code: data.code, payload: "Missing 'uid' field in the request body." });
  }

  // RBAC
  let role = await getUserRole(uid);

  if (role == null) {
    return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
  }

  let reqs = await checkRole(role, "users", "delete");
  if (reqs === false) {
    return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
  }
  // END OF RBAC

  // Call controller method for user data fetch
  try {
    let data = await users.deleteUser(uid);
    return res.status(200).json(data);
  }
  catch (error) {
    return res.status(401).json({ code: data.code, payload: error });
  }
});

module.exports = router;