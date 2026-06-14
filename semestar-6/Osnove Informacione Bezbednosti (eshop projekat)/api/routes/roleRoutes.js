const { verifyToken } = require('../middleware/verify');
const express = require('express');
const router = express.Router();
const roles = require('../controllers/roleController');
const { checkRole, getUserRole } = require('../middleware/role');
const admin = require('../firebaseConfig');

// Role route to get all roles
router.post('/get', verifyToken, async (req, res) => {
    const { uid } = req.body;
  
    // RBAC
    let role = await getUserRole(uid);
  
    if (role == null) {
      return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
    }
  
    let reqs = await checkRole(role, "roles", "read");
    if (reqs === false) {
      return res.status(403).json({ code: 403, payload: "You don't have permission to view this data" });
    }
    // END OF RBAC
  
    // Call controller method for users data fetch
    let data = await roles.getRoles(uid);
    return res.status(200).json(data);
  });

module.exports = router;