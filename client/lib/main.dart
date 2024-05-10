import 'dart:convert';
import 'package:client/model/event.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:client/view/login_screen.dart';
import 'package:client/view/register_screen.dart';
import 'package:client/view/table_calendar.dart'; // Assuming this is where your EventCalendarScreen is defined
import 'package:client/view/main_screen.dart';
import 'package:client/view/stuff_list_screen.dart';
import 'package:client/view/actor_list_screen.dart';
import 'package:client/view/news_list_screen.dart';

void main() => runApp(const JoJoApp());

class JoJoApp extends StatelessWidget {
  const JoJoApp({Key? key}) : super(key: key);

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
        '/listOfNews': (context) => const NewsListScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => RegisterScreen(),
        '/events': (context) => FutureBuilder<List<Event>>(
          future: fetchEvents(), // Fetch events asynchronously
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error fetching events'));
            } else if (snapshot.hasData) {
              return EventCalendarScreen(events: snapshot.data!);
            } else {
              return const Center(child: Text('No data available'));
            }
          },
        ),
      },
    );
  }

  Future<List<Event>> fetchEvents() async {
    final response = await http.get(Uri.parse('https://jojowiki.onrender.com/events'));

    if (response.statusCode == 200) {
      Iterable<dynamic> eventsJson = jsonDecode(response.body);
      List<Event> events = eventsJson.map((e) => Event.fromJson(e)).toList();
      return events;
    } else {
      throw Exception('Failed to load events');
    }
  }
}
