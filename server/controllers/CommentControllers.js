const firebase = require('../firebase.js');
const Comment = require('../models/Comment.js');
const { getFirestore, collection, doc, addDoc, getDoc, getDocs, updateDoc, deleteDoc } = require('firebase/firestore');

const db = getFirestore(firebase);

exports.CreateComment = async (req, res, next) => {
  try {
    const data = req.body;
    await addDoc(collection(db, 'comments'), data);
    res.status(200).send('Comment created successfully');
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
}

exports.GetComments = async (req, res, next) => {
  try {
    const comments = await getDocs(collection(db, 'comments'));
    const commentsArray = [];

    if(comments.empty) {
      res.status(404).json({ message: 'No comments found' });
    } else {
      comments.forEach(comment => {
        const commentData = comment.data();
        const newComment = new Comment(comment.id, commentData.text, commentData.username);
        commentsArray.push(newComment);
      });

      res.status(200).json(commentsArray);
    }
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
}

exports.GetComment = async (req, res, next) => {
  try {
    const commentId = req.params.id;
    const commentRef = doc(db, 'comments', commentId);
    const commentSnapshot = await getDoc(commentRef);

    if (commentSnapshot.exists()) {
      const commentData = commentSnapshot.data();
      const comment = new Comment(commentSnapshot.id, commentData.text, commentData.username);
      res.status(200).json(comment);
    } else {
      res.status(404).json({ message: 'Comment not found' });
    }
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

exports.UpdateComment = async (req, res, next) => {
  try {
    const commentId = req.params.id;
    const data = req.body;

    const commentRef = doc(db, 'comments', commentId);

    await updateDoc(commentRef, data);

    res.status(200).send('Comment updated successfully');
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};

exports.DeleteComment = async (req, res, next) => {
  try {
    const commentId = req.params.id;

    await deleteDoc(doc(db, 'comments', commentId));

    res.status(200).send('Comment deleted successfully');
  } catch (error) {
    res.status(400).json({ message: error.message });
  }
};
