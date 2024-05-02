import 'package:flutter/material.dart';
import '../controller/news_controller.dart';
import '../model/news.dart';
import '../view/jojo_drawer.dart';

class NewsListScreen extends StatelessWidget {
  final NewsController _newsController = NewsController();

  @override
  Widget build(BuildContext context) {
    List<News> newsList = _newsController.getNewsList();

    return Scaffold(
      appBar: AppBar(
        title: Text('List of News'),
      ),
      drawer: JoJoDrawer(),
      body: ListView(
        children: newsList.map((news) => ListTile(title: Text(news.title))).toList(),
      ),
    );
  }
}
