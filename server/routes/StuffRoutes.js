const express = require('express');
const StuffControllers = require('../controllers/StuffControllers');

const router = express.Router();

/**
 * @swagger
 * tags:
 *   name: Stuff
 *   description: API endpoints for managing stuffs
 */

/**
 * @swagger
 * components:
 *   schemas:
 *     Stuff:
 *       type: object
 *       properties:
 *         id:
 *           type: string
 *           description: The ID of the stuff.
 *         name:
 *           type: string
 *           description: The name of the stuff.
 *         age:
 *           type: number
 *           description: The age of the stuff.
 *         role:
 *           type: string
 *           description: The role of the stuff.
 *         description:
 *           type: string
 *           description: The description of the stuff.
 *         imageUrl:
 *           type: string
 *           description: The URL of the stuff image.
 */

/**
 * @swagger
 * /stuffs:
 *   get:
 *     summary: Get a list of all stuffs
 *     tags: [Stuff]
 *     responses:
 *       '200':
 *         description: A successful response
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/Stuff'
 *       '404':
 *         description: No stuffs found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: No stuffs found

 *   post:
 *     summary: Create a new stuff
 *     tags: [Stuff]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Stuff'
 *     responses:
 *       '201':
 *         description: Stuff created successfully
 *         content:
 *           application/json:
 *             example:
 *               message: Stuff created successfully
 *       '400':
 *         description: Bad Request
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: Bad Request

 */

/**
 * @swagger
 * /stuffs/{id}:
 *   get:
 *     summary: Get a stuff by ID
 *     tags: [Stuff]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID of the stuff to retrieve
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: A successful response
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Stuff'
 *       '404':
 *         description: Stuff not found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: Stuff not found

 *   put:
 *     summary: Update a stuff by ID
 *     tags: [Stuff]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID of the stuff to update
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Stuff'
 *     responses:
 *       '200':
 *         description: Stuff updated successfully
 *         content:
 *           application/json:
 *             example:
 *               message: Stuff updated successfully
 *       '404':
 *         description: Stuff not found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: Stuff not found
 *       '400':
 *         description: Bad Request
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: Bad Request

 *   delete:
 *     summary: Delete a stuff by ID
 *     tags: [Stuff]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID of the stuff to delete
 *         schema:
 *           type: string
 *     responses:
 *       '204':
 *         description: Stuff deleted successfully
 *       '404':
 *         description: Stuff not found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: Stuff not found

 */

router.get('/', StuffControllers.GetStuffs);
router.get('/:id', StuffControllers.GetStuffById);
router.post('/', StuffControllers.CreateStuff);
router.put('/:id', StuffControllers.UpdateStuff);
router.delete('/:id', StuffControllers.DeleteStuff);

module.exports = router;
