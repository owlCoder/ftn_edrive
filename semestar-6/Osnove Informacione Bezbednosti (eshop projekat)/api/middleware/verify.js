const admin = require('../firebaseConfig');

const verifyToken = async (req, res, next) => {
  try {
    const idToken = req.headers.authorization;
    const decodedToken = await admin.auth().verifyIdToken(idToken);
    req.user = decodedToken;
    next();
  } catch (error) {
    console.log(error)
    res.status(401).json({ error: 'Unauthorized' + error });
  }
};

module.exports = { verifyToken };