import 'package:flutter/material.dart';
import 'package:client/view/main_screen.dart';
import 'package:client/view/stuff_list_screen.dart';
import 'package:client/view/actor_list_screen.dart';
import 'package:client/view/news_list_screen.dart';

void main() => runApp(const JoJoApp());

class JoJoApp extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const JoJoApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JoJo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreen(),
        '/listOfStuff': (context) => const StuffListScreen(),
        '/listOfActors': (context) => ActorListScreen(),
        '/listOfNews': (context) => const NewsListScreen()
      },
    );
  }
}
