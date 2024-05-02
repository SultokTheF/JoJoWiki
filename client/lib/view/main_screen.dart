import 'package:flutter/material.dart';
import '../controller/stuff_controller.dart';
import '../controller/actor_controller.dart';
import '../controller/news_controller.dart';
import '../controller/comment_controller.dart';
import '../view/jojo_drawer.dart';

class MainScreen extends StatelessWidget {
  final StuffController _stuffController = StuffController();
  final ActorController _actorController = ActorController();
  final NewsController _newsController = NewsController();
  final CommentController _commentController = CommentController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JoJo App'),
      ),
      drawer: JoJoDrawer(),
      body: Center(
        child: Text('Welcome to JoJo App!'),
      ),
    );
  }
}
