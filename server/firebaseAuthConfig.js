const { 
  getAuth, 
  createUserWithEmailAndPassword, 
  signInWithEmailAndPassword, 
  signOut, 
  sendEmailVerification, 
  sendPasswordResetEmail

} = require("firebase/auth") ;

const admin = require('firebase-admin');
const serviceAccount = require("./FirebaseService.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

module.exports = {
  getAuth,
  signInWithEmailAndPassword,
  createUserWithEmailAndPassword,
  signOut,
  sendEmailVerification,
  sendPasswordResetEmail,
  admin
};