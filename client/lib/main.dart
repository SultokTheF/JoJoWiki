import 'package:flutter/material.dart';
import 'package:client/view/main_screen.dart';
import 'package:client/view/stuff_list_screen.dart';
import 'package:client/view/actor_list_screen.dart';
import 'package:client/view/news_list_screen.dart';
import 'package:client/view/comments_list_screen.dart';

void main() => runApp(JoJoApp());

class JoJoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JoJo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/listOfStuff': (context) => StuffListScreen(),
        '/listOfActors': (context) => ActorListScreen(),
        '/listOfNews': (context) => NewsListScreen(),
        '/listOfComments': (context) => CommentsListScreen(),
      },
    );
  }
}
