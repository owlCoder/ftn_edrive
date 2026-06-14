import { initializeApp } from "firebase/app";
import { getAuth } from "firebase/auth";
import { getFirestore } from 'firebase/firestore';

const firebaseConfig = {
  apiKey: 'AIzaSyDlOj_1Z0eCE-Jb4q92hEewpAus0fNwRrA',
  authDomain: 'oibis-ftn.firebaseapp.com',
  projectId: 'oibis-ftn',
  storageBucket: 'oibis-ftn.appspot.com',
  messagingSenderId: '1049634728195',
  appId: '1:1049634728195:web:aec8a402e8cacd3d8ee136',
  measurementId: 'V5TPZVDY4N'
}; 

const app = initializeApp(firebaseConfig);

// gives us an auth instance
const auth = getAuth(app);

const firestore = getFirestore(app);

// in order to use this auth instance elsewhere
export { auth, firestore };