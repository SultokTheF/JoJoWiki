import express from 'express';
import cors from 'cors';

import config from './config.js';

// Create an express app
const app = express();

// Middleware
app.use(cors({
  credentials: true,
}));
app.use(express.json());

// Start the server
const start = async () => {
  try {
    app.listen(config.port, () => {
      console.log(`Server started on: ${config.hostUrl}`);
    });
  } catch (error) {
    console.error("Error starting the server:", error);
  }
};

start();
