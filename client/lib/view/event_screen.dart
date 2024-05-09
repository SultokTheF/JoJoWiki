import 'package:client/view/jojo_drawer.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Event {
  final String id;
  final String name;
  final String location;
  final DateTime date;
  final String description;

  Event({
    required this.id,
    required this.name,
    required this.location,
    required this.date,
    required this.description,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      date: DateTime.parse(json['date']),
      description: json['description'],
    );
  }
}

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Event>> _events = {};

  @override
  void initState() {
    super.initState();
    fetchRandomEvents();
  }

  Future<void> fetchRandomEvents() async {
    final response =
        await http.get(Uri.parse('http://localhost:8080/events/random/get'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      List<Event> events =
          responseData.map((data) => Event.fromJson(data)).toList();

      setState(() {
        _events.clear();
        for (Event event in events) {
          DateTime eventDate = event.date;
          _events[eventDate] = [...(_events[eventDate] ?? []), event];
        }
      });
    } else {
      throw Exception('Failed to load events');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar with Events'),
      ),
      drawer: JoJoDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2022, 1, 1),
              lastDay: DateTime.utc(2025, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                });
              },
              eventLoader: (day) {
                return _events[day] ?? [];
              },
            ),
            if (_selectedDay != null) ...[
              SizedBox(height: 20),
              Text(
                'Events on ${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              if (_events.containsKey(_selectedDay!)) ...[
                for (Event event in _events[_selectedDay!]!) ...[
                  ListTile(
                    title: Text(event.name),
                    subtitle: Text(
                        'Location: ${event.location}\nDescription: ${event.description}'),
                  ),
                ],
              ] else
                Text('No events found'),
            ],
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CalendarScreen(),
  ));
}
