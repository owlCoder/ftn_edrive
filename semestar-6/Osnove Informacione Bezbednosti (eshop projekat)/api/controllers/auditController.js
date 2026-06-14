const admin = require('../firebaseConfig');

const createAudit = async (data) => {
  try {
    await admin.firestore().collection("audits").add({
      messageType: data.messageType,
      message: data.message,
      date: admin.firestore.FieldValue.serverTimestamp()
    }
    );

    return { code: 200, payload: "Audit has been created" };
  } catch (error) {
    return { code: 400, payload: "Audit can't be created" };
  }
};

const readAudits = async () => {
  try {
    const auditRef = admin.firestore().collection('audits');
    const auditsSnapshot = await auditRef.get();
    const auditsData = [];

    auditsSnapshot.forEach((doc) => {
      auditsData.push(doc.data());
    });

    return { code: 200, payload: auditsData };
  } catch (error) {
    return { code: 500, payload: "Internal Server Error" };
  }
};

module.exports = { createAudit, readAudits };