import 'package:flutter/material.dart';
import 'package:client/view/main_screen.dart';
import 'package:client/view/stuff_list_screen.dart';
import 'package:client/view/actor_list_screen.dart';
import 'package:client/view/news_list_screen.dart';
import 'package:client/view/login_screen.dart'; // Import LoginScreen
import 'package:client/view/register_screen.dart'; // Import RegisterScreen
import 'package:client/view/event_screen.dart'; // Import EventScreen

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
        '/login': (context) => LoginPage(), // Add route for LoginScreen
        '/register': (context) => RegisterPage(), // Add route for RegisterScreen
        '/events': (context) => const CalendarScreen(), // Add route for EventScreen
      },
    );
  }
}
