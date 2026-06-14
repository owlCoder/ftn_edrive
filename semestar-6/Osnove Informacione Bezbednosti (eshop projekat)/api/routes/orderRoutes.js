const { verifyToken } = require('../middleware/verify');
const express = require('express');
const router = express.Router();
const orders = require('../controllers/orderController');
const { checkRole, getUserRole } = require('../middleware/role');

router.post('/create', verifyToken, async (req, res) => {
    const { buyQuantity, buyerUid, product} = req.body;

    // RBAC
    let role = await getUserRole(buyerUid);

    if (role == null || buyerUid === "") {
        return { code: 403, payload: "You don't have permission to view this data" };
    }

    let reqs = await checkRole(role, "orders", "write");
   
    if (reqs === false) {
        return { code: 403, payload: "You don't have permission to view this data" };
    }
    // END OF RBAC
    
    // Call controller method to create the order
    let data = await orders.createOrder(buyerUid, buyQuantity, product);
    return res.status(data.code).json({ code: data.code, payload: data.payload });
});

// Route to read orders
router.post('/getOrdersPerBuyer', verifyToken, async (req, res) => {
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

    let reqs = await checkRole(role, "orders", "read");
    if (reqs === false) {
        return { code: 403, payload: "You don't have permission to view this data" };
    }
    // END OF RBAC

    // Call controller method to read the orders
    let data = await orders.readOrderPerUser(uid);
    return res.status(data.code).json({ code: data.code, payload: data.payload });
});

// Route to read orders
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

  let reqs = await checkRole(role, "orders", "read");
  if (reqs === false) {
      return { code: 403, payload: "You don't have permission to view this data" };
  }
  // END OF RBAC

  // Call controller method to read the orders
  let data = await orders.readAllOrders();
  return res.status(data.code).json({ code: data.code, payload: data.payload });
});


module.exports = router;