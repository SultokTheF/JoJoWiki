const express = require('express');
const router = express.Router();

const FirebaseAuthController = require('../controllers/FirebaseAuthController');

/**
 * @swagger
 * tags:
 *   name: Firebase Authentication
 *   description: API endpoints for Firebase Authentication
 */

/**
 * @swagger
 * components:
 *   schemas:
 *     ErrorResponse:
 *       type: object
 *       properties:
 *         error:
 *           type: string
 *           description: Description of the error message.
 *     UserCredential:
 *       type: object
 *       properties:
 *         idToken:
 *           type: string
 *           description: The user's ID token for authentication.
 *         refreshToken:
 *           type: string
 *           description: The user's refresh token.
 *         user:
 *           type: object
 *           properties:
 *             uid:
 *               type: string
 *               description: The user's unique identifier.
 *             email:
 *               type: string
 *               description: The user's email address.
 *             emailVerified:
 *               type: boolean
 *               description: Indicates if the user's email is verified.
 */

/**
 * @swagger
 * /auth/register:
 *   post:
 *     summary: Register a new user
 *     tags: [Firebase Authentication]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             properties:
 *               email:
 *                 type: string
 *                 description: The user's email address.
 *               password:
 *                 type: string
 *                 description: The user's password.
 *     responses:
 *       '201':
 *         description: User registered successfully.
 *         content:
 *           application/json:
 *             schema:
 *               properties:
 *                 message:
 *                   type: string
 *                   description: Success message.
 *       '422':
 *         description: Invalid input data.
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/ErrorResponse'
 *       '500':
 *         description: Internal server error.
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/ErrorResponse'
 */

router.post('/register', FirebaseAuthController.registerUser);

/**
 * @swagger
 * /auth/login:
 *   post:
 *     summary: Login a user
 *     tags: [Firebase Authentication]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             properties:
 *               email:
 *                 type: string
 *                 description: The user's email address.
 *               password:
 *                 type: string
 *                 description: The user's password.
 *     responses:
 *       '200':
 *         description: User logged in successfully.
 *         content:
 *           application/json:
 *             schema:
 *               properties:
 *                 message:
 *                   type: string
 *                   description: Success message.
 *                 userCredential:
 *                   $ref: '#/components/schemas/UserCredential'
 *       '422':
 *         description: Invalid input data.
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/ErrorResponse'
 *       '500':
 *         description: Internal server error.
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/ErrorResponse'
 */

router.post('/login', FirebaseAuthController.loginUser);

module.exports = router;
