import 'package:flutter/material.dart';
import '../controller/news_controller.dart';
import '../model/news.dart';
import '../view/jojo_drawer.dart';
import 'news_details_screen.dart'; // Import the NewsDetailsScreen

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  final NewsController _newsController = NewsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JoJo Wiki Development News'),
      ),
      drawer: const JoJoDrawer(),
      body: FutureBuilder<List<News>>(
        future: _newsController.getNewsList(), // Use FutureBuilder here
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<News>? newsList = snapshot.data;
            return ListView.builder(
              itemCount: newsList?.length ?? 0,
              itemBuilder: (context, index) {
                News news = newsList![index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        news.photoUrl,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          news.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Text(
                          news.mainText,
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsDetailsScreen(news: news),
                            ),
                          );
                        },
                        child: const Text('Go to News'),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
