const { initializeApp } = require('firebase/app');
const { getAnalytics } = require('firebase/analytics');

const config = require('./config.js');

const firebase = initializeApp(config.firebaseConfig);
// const analytics = getAnalytics(firebase);

module.exports = firebase;
