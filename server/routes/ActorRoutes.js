const express = require('express');
const ActorControllers = require('../controllers/ActorControllers');

const router = express.Router();

/**
 * @swagger
 * tags:
 *   name: Actors
 *   description: API endpoints for managing actors
 */

/**
 * @swagger
 * components:
 *   schemas:
 *     Actor:
 *       type: object
 *       properties:
 *         id:
 *           type: string
 *           description: The ID of the actor.
 *         name:
 *           type: string
 *           description: The name of the actor.
 *         season:
 *           type: string
 *           description: The season of the actor.
 *         age:
 *           type: number
 *           description: The age of the actor.
 *         description:
 *           type: string
 *           description: The description of the actor.
 *         slogan:
 *           type: string
 *           description: The slogan of the actor.
 */

/**
 * @swagger
 * /actors:
 *   get:
 *     summary: Get a list of all actors
 *     tags: [Actors]
 *     responses:
 *       '200':
 *         description: A successful response
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/Actor'
 *       '404':
 *         description: No actors found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: No actors found

 *   post:
 *     summary: Create a new actor
 *     tags: [Actors]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Actor'
 *     responses:
 *       '201':
 *         description: Actor created successfully
 *         content:
 *           application/json:
 *             example:
 *               message: Actor created successfully
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
 * /actors/{id}:
 *   get:
 *     summary: Get an actor by ID
 *     tags: [Actors]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID of the actor to retrieve
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: A successful response
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Actor'
 *       '404':
 *         description: Actor not found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: Actor not found

 *   put:
 *     summary: Update an existing actor
 *     tags: [Actors]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID of the actor to update
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Actor'
 *     responses:
 *       '200':
 *         description: Actor updated successfully
 *         content:
 *           application/json:
 *             example:
 *               message: Actor updated successfully
 *       '404':
 *         description: Actor not found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: Actor not found
 *       '400':
 *         description: Bad Request
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: Bad Request

 *   delete:
 *     summary: Delete an actor by ID
 *     tags: [Actors]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID of the actor to delete
 *         schema:
 *           type: string
 *     responses:
 *       '204':
 *         description: Actor deleted successfully
 *       '404':
 *         description: Actor not found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: Actor not found

 */

router.get('/', ActorControllers.GetActors);
router.get('/:id', ActorControllers.GetActor);
router.post('/', ActorControllers.CreateActor);
router.put('/:id', ActorControllers.UpdateActor);
router.delete('/:id', ActorControllers.DeleteActor);

module.exports = router;
