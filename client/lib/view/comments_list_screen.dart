import 'package:flutter/material.dart';
import '../controller/comment_controller.dart';
import '../model/comment.dart';
import '../view/jojo_drawer.dart';

class CommentsListScreen extends StatelessWidget {
  final CommentController _commentController = CommentController();

  @override
  Widget build(BuildContext context) {
    List<Comment> commentList = _commentController.getCommentList();

    return Scaffold(
      appBar: AppBar(
        title: Text('List of Comments'),
      ),
      drawer: JoJoDrawer(),
      body: ListView(
        children: commentList.map((comment) => ListTile(title: Text(comment.text))).toList(),
      ),
    );
  }
}
