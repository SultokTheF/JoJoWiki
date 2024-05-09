const express = require('express');
const EventControllers = require('../controllers/EventControllers');

const router = express.Router();

/**
 * @swagger
 * tags:
 *   name: Events
 *   description: API endpoints for managing events
 */

/**
 * @swagger
 * components:
 *   schemas:
 *     Event:
 *       type: object
 *       properties:
 *         id:
 *           type: string
 *           description: The ID of the event.
 *         name:
 *           type: string
 *           description: The name of the event.
 *         location:
 *           type: string
 *           description: The location of the event.
 *         date:
 *           type: string
 *           description: The date of the event.
 *         description:
 *           type: string
 *           description: The description of the event.
 */

/**
 * @swagger
 * /events/random/get:
 *   get:
 *     summary: Get a random event
 *     tags: [Events]
 *     responses:
 *       '200':
 *         description: A successful response
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Event'
 *       '404':
 *         description: No events found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: No events found
 */

/**
 * @swagger
 * /events:
 *   get:
 *     summary: Get a list of all events
 *     tags: [Events]
 *     responses:
 *       '200':
 *         description: A successful response
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/Event'
 *       '404':
 *         description: No events found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: No events found

 *   post:
 *     summary: Create a new event
 *     tags: [Events]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Event'
 *     responses:
 *       '201':
 *         description: Event created successfully
 *         content:
 *           application/json:
 *             example:
 *               message: Event created successfully
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
 * /events/{id}:
 *   get:
 *     summary: Get an event by ID
 *     tags: [Events]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID of the event to retrieve
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: A successful response
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Event'
 *       '404':
 *         description: Event not found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: Event not found

 *   put:
 *     summary: Update an existing event
 *     tags: [Events]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID of the event to update
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Event'
 *     responses:
 *       '200':
 *         description: Event updated successfully
 *         content:
 *           application/json:
 *             example:
 *               message: Event updated successfully
 *       '404':
 *         description: Event not found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: Event not found
 *       '400':
 *         description: Bad Request
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: Bad Request

 *   delete:
 *     summary: Delete an event by ID
 *     tags: [Events]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID of the event to delete
 *         schema:
 *           type: string
 *     responses:
 *       '204':
 *         description: Event deleted successfully
 *       '404':
 *         description: Event not found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: Event not found

 */


router.get('/', EventControllers.GetEvents);
router.get('/:id', EventControllers.GetEvent);
router.post('/', EventControllers.CreateEvent);
router.put('/:id', EventControllers.UpdateEvent);
router.delete('/:id', EventControllers.DeleteEvent);
router.get('/random/get', EventControllers.GetRandomEvent);

module.exports = router;
