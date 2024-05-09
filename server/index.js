const express = require('express');
const cors = require('cors');
const swaggerUi = require('swagger-ui-express');
const swaggerJsdoc = require('swagger-jsdoc');
const config = require('./config.js');
const ActorRoutes = require('./routes/ActorRoutes.js');

// swagger
const options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'JoJo Wiki API',
      version: '1.0.0',
      description: 'API for managing JoJo information.',
    },
    servers: [
      { url: 'http://localhost:8080' },
    ],
  },
  apis: ['./routes/*.js'],
};

const specs = swaggerJsdoc(options);

// Create an express app
const app = express();

// Middleware
app.use(cors({ credentials: true }));
app.use(express.json());

// Routes
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(specs));
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
