class Actor {
  final String id;
  final String name;
  final String season;
  final int age;
  final String description;
  final String imageUrl;
  final String slogan;

  Actor({
    required this.id,
    required this.name,
    required this.season,
    required this.age,
    required this.description,
    required this.imageUrl,
    required this.slogan,
  });

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
      id: json['id'],
      name: json['name'],
      season: json['season'],
      age: json['age'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      slogan: json['slogan'],
    );
  }
}
