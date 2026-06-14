const admin = require('../firebaseConfig');

const getGenres = async () => {
    try {
      const genreRef = admin.firestore().collection('genres');
      const genreSnapshot = await genreRef.get();
      const genreData = [];
  
      genreSnapshot.forEach((doc) => {
        genreData.push(doc.data());
      });      
  
      return { code: 200, payload: genreData };
    } catch (error) {
      await admin.firestore().collection("audits").add({
        messageType: "ERROR",
        message: error.message,
        date: admin.firestore.FieldValue.serverTimestamp(),
      });
      return { code: 500, payload: "Internal Server Error" };
    }
};

module.exports = { getGenres };