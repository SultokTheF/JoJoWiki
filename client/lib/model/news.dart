class News {
  final String id;
  final String title;
  final String photoUrl;
  final String mainText;

  News({required this.id, required this.title, required this.photoUrl, required this.mainText});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      title: json['title'],
      photoUrl: json['photoUrl'],
      mainText: json['mainText'],
    );
  }
}
