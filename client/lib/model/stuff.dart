class Stuff {
  final String id;
  final String name;
  final int age;
  final String role;
  final String description;
  final String imageUrl;

  Stuff({
    required this.id,
    required this.name,
    required this.age,
    required this.role,
    required this.description,
    required this.imageUrl,
  });

  factory Stuff.fromJson(Map<String, dynamic> json) {
    return Stuff(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      role: json['role'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }
}
