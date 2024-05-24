import 'package:hive/hive.dart';

part 'news.g.dart';

@HiveType(typeId: 0)
class News {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String photoUrl;

  @HiveField(3)
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
