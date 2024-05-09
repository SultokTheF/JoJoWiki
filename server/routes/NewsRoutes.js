const express = require('express');
const NewsControllers = require('../controllers/NewsControllers');

const router = express.Router();

/**
 * @swagger
 * tags:
 *   name: News
 *   description: API endpoints for managing news
 */

/**
 * @swagger
 * components:
 *   schemas:
 *     News:
 *       type: object
 *       properties:
 *         id:
 *           type: string
 *           description: The ID of the news.
 *         title:
 *           type: string
 *           description: The title of the news.
 *         photoUrl:
 *           type: string
 *           description: The URL of the news photo.
 *         mainText:
 *           type: string
 *           description: The main text/content of the news.
 */

/**
 * @swagger
 * /news:
 *   get:
 *     summary: Get a list of all news
 *     tags: [News]
 *     responses:
 *       '200':
 *         description: A successful response
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/News'
 *       '404':
 *         description: No news found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: No news found

 *   post:
 *     summary: Create a new news
 *     tags: [News]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/News'
 *     responses:
 *       '201':
 *         description: News created successfully
 *         content:
 *           application/json:
 *             example:
 *               message: News created successfully
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
 * /news/{id}:
 *   get:
 *     summary: Get news by ID
 *     tags: [News]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID of the news to retrieve
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: A successful response
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/News'
 *       '404':
 *         description: News not found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: News not found

 *   put:
 *     summary: Update an existing news
 *     tags: [News]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID of the news to update
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/News'
 *     responses:
 *       '200':
 *         description: News updated successfully
 *         content:
 *           application/json:
 *             example:
 *               message: News updated successfully
 *       '404':
 *         description: News not found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: News not found
 *       '400':
 *         description: Bad Request
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: Bad Request

 *   delete:
 *     summary: Delete news by ID
 *     tags: [News]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID of the news to delete
 *         schema:
 *           type: string
 *     responses:
 *       '204':
 *         description: News deleted successfully
 *       '404':
 *         description: News not found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: News not found

 */

router.get('/', NewsControllers.GetNews);
router.get('/:id', NewsControllers.GetNewsById);
router.post('/', NewsControllers.CreateNews);
router.put('/:id', NewsControllers.UpdateNews);
router.delete('/:id', NewsControllers.DeleteNews);

module.exports = router;
