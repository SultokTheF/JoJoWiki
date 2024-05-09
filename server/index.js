const express = require('express');
const cors = require('cors');

const config = require('./config.js');

const ActorRoutes = require('./routes/ActorRoutes.js');

// Create an express app
const app = express();

// Middleware
app.use(cors({
  credentials: true,
}));
app.use(express.json());

// Routes
app.use('/actors', ActorRoutes);

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
