const { verifyToken } = require('../middleware/verify');
const express = require('express');
const router = express.Router();
const audits = require('../controllers/auditController');
const { checkRole, getUserRole } = require('../middleware/role');

// Route to create a new audit
router.post('/create', async (req, res) => {
    const { messageType, message } = req.body;

    // Call controller method to create an audit
    let data = await audits.createAudit({ messageType, message });
    return res.status(data.code).json({ code: data.code, payload: data.payload });
});

// Route to read all audits
router.post('/get', verifyToken, async (req, res) => {
    const { uid } = req.body;

    // Check if the request contains the 'uid' field in the body
    if (!uid) {
        return res.status(400).json({ error: "Missing 'uid' field in the request body." });
    }

    // RBAC
    let role = await getUserRole(uid);

    if (role == null) {
        return { code: 403, payload: "You don't have permission to view this data" };
    }

    let reqs = await checkRole(role, "audits", "read");
    if (reqs === false) {
        return { code: 403, payload: "You don't have permission to view this data" };
    }
    // END OF RBAC

    // Call controller method to read the audits
    let data = await audits.readAudits();
    return res.status(data.code).json({ code: data.code, payload: data.payload });
});

module.exports = router;