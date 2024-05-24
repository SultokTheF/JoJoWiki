import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/news.dart';
import 'package:hive/hive.dart';

class NewsController {
  Future<List<News>> getNewsList() async {
    final response = await http.get(Uri.parse('https://jojowiki.onrender.com/news'));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<News> newsList = jsonResponse.map((model) => News.fromJson(model)).toList();
      return newsList;
    } else {
      throw Exception('Failed to load news');
    }
  }

  Future<List<News>> getNewsFromHive() async {
    final box = await Hive.openBox<News>('newsBox');
    return box.values.toList();
  }

  Future<void> saveNewsToHive(String id, News news) async {
    final box = await Hive.openBox<News>('newsBox');
    await box.put(id, news);
  }

  Future<void> deleteNewsFromHive(String id) async {
    final box = await Hive.openBox<News>('newsBox');
    await box.delete(id);
  }
}
