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