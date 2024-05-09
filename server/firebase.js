import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";

import config from './config.js';

const firebase = initializeApp(config.firebaseConfig);
const analytics = getAnalytics(firebase);

export default firebase;