import 'package:client/model/event.dart';
import 'package:client/view/jojo_drawer.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class EventCalendarScreen extends StatefulWidget {
  final List<Event> events;

  const EventCalendarScreen({Key? key, required this.events}) : super(key: key);

  @override
  _EventCalendarScreenState createState() => _EventCalendarScreenState();
}

class _EventCalendarScreenState extends State<EventCalendarScreen> {
  late Map<DateTime, List<Event>> _eventsMap;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _eventsMap = _groupEventsByDate(widget.events);
  }

  Map<DateTime, List<Event>> _groupEventsByDate(List<Event> events) {
    Map<DateTime, List<Event>> map = {};
    for (Event event in events) {
      DateTime date = event.date;
      DateTime normalizedDate = DateTime(date.year, date.month, date.day);
      if (map.containsKey(normalizedDate)) {
        map[normalizedDate]!.add(event);
      } else {
        map[normalizedDate] = [event];
      }
    }
    return map;
  }

  List<Event> _getEventsForDay(DateTime day) {
    return _eventsMap[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Calendar'),
      ),
      drawer: JoJoDrawer(),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.now(),
            lastDay: DateTime.now().add(Duration(days: 365)), // Set lastDay to a year from firstDay
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
            eventLoader: _getEventsForDay,
          ),
          SizedBox(height: 16),
          if (_selectedDay != null && _eventsMap[_selectedDay!] != null)
            Expanded(
              child: ListView(
                children: _eventsMap[_selectedDay!]!.map((event) {
                  return ListTile(
                    title: Text(event.name),
                    subtitle: Text(event.location),
                    trailing: Text('${event.date.day}/${event.date.month}/${event.date.year}'),
                    onTap: () {
                      _showEventDetails(event);
                    },
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }

  void _showEventDetails(Event event) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(event.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Location: ${event.location}'),
              Text('Date: ${event.date.day}/${event.date.month}/${event.date.year}'),
              Text('Description: ${event.description}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
