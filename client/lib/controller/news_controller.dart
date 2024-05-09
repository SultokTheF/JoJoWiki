import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/news.dart';

class NewsController {
  Future<List<News>> getNewsList() async {
    final response = await http.get(Uri.parse('http://localhost:8080/news'));
    
    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      List<News> newsList = jsonResponse.map((model) => News.fromJson(model)).toList();
      return newsList;
    } else {
      throw Exception('Failed to load news');
    }
  }
}
