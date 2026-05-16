import { initializeApp } from "https://www.gstatic.com/firebasejs/10.12.2/firebase-app.js";

import {
  getAuth
} from "https://www.gstatic.com/firebasejs/10.12.2/firebase-auth.js";

const firebaseConfig = {
  apiKey: "AIzaSyDsF5zzvKZgZBWJFMlQzi5KxmJ37LZWcXw",
  authDomain: "login-a22d3.firebaseapp.com",
  projectId: "login-a22d3",
  storageBucket: "login-a22d3.firebasestorage.app",
  messagingSenderId: "432575641723",
  appId: "1:432575641723:web:013a3e412111aa86e84ade",
  measurementId: "G-80N0MB4W67"
};

const app = initializeApp(firebaseConfig);

export const auth = getAuth(app);