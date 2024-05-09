import 'package:flutter/material.dart';
import 'package:client/view/main_screen.dart';
import 'package:client/view/stuff_list_screen.dart';
import 'package:client/view/actor_list_screen.dart';
import 'package:client/view/news_list_screen.dart';
import 'package:client/view/login_screen.dart'; // Import LoginScreen
import 'package:client/view/register_screen.dart'; // Import RegisterScreen

void main() => runApp(const JoJoApp());

class JoJoApp extends StatelessWidget {
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
        '/listOfStuff': (context) => StuffListScreen(),
        '/listOfActors': (context) => ActorListScreen(),
        '/listOfNews': (context) => const NewsListScreen(),
        '/login': (context) => LoginScreen(), // Add route for LoginScreen
        '/register': (context) => RegisterScreen(), // Add route for RegisterScreen
      },
    );
  }
}
