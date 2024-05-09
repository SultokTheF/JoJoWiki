const express = require('express');
const CommentControllers = require('../controllers/CommentControllers');

const router = express.Router();

/**
 * @swagger
 * tags:
 *   name: Comments
 *   description: API endpoints for managing comments
 */

/**
 * @swagger
 * components:
 *   schemas:
 *     Comment:
 *       type: object
 *       properties:
 *         text:
 *           type: string
 *           description: The text content of the comment.
 *         username:
 *           type: string
 *           description: The username of the commenter. Default is 'Anonymous'.
 *         newsId:
 *           type: string
 *           description: The ID of the associated news post.
 */

/**
 * @swagger
 * /comments:
 *   get:
 *     summary: Get a list of all comments
 *     tags: [Comments]
 *     responses:
 *       '200':
 *         description: A successful response
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/Comment'
 *       '404':
 *         description: No comments found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: No comments found

 *   post:
 *     summary: Create a new comment
 *     tags: [Comments]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Comment'
 *     responses:
 *       '201':
 *         description: Comment created successfully
 *         content:
 *           application/json:
 *             example:
 *               message: Comment created successfully
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
 * /comments/{id}:
 *   get:
 *     summary: Get a comment by ID
 *     tags: [Comments]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID of the comment to retrieve
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: A successful response
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Comment'
 *       '404':
 *         description: Comment not found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: Comment not found

 *   put:
 *     summary: Update an existing comment
 *     tags: [Comments]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID of the comment to update
 *         schema:
 *           type: string
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Comment'
 *     responses:
 *       '200':
 *         description: Comment updated successfully
 *         content:
 *           application/json:
 *             example:
 *               message: Comment updated successfully
 *       '404':
 *         description: Comment not found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: Comment not found
 *       '400':
 *         description: Bad Request
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: Bad Request

 *   delete:
 *     summary: Delete a comment by ID
 *     tags: [Comments]
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         description: ID of the comment to delete
 *         schema:
 *           type: string
 *     responses:
 *       '204':
 *         description: Comment deleted successfully
 *       '404':
 *         description: Comment not found
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: Comment not found

 */

/**
 * @swagger
 * /comments/news/{newsId}:
 *   get:
 *     summary: Get comments for a specific news post
 *     tags: [Comments]
 *     parameters:
 *       - in: path
 *         name: newsId
 *         required: true
 *         description: ID of the news post to retrieve comments for
 *         schema:
 *           type: string
 *     responses:
 *       '200':
 *         description: A successful response
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/Comment'
 *       '404':
 *         description: No comments found for this news post
 *         content:
 *           application/json:
 *             example:
 *               error:
 *                 message: No comments found for this news post

 */

router.get('/', CommentControllers.GetComments);
router.get('/:id', CommentControllers.GetComment);
router.post('/', CommentControllers.CreateComment);
router.put('/:id', CommentControllers.UpdateComment);
router.delete('/:id', CommentControllers.DeleteComment);
router.get('/news/:newsId', CommentControllers.GetCommentsByNewsID); 

module.exports = router;
