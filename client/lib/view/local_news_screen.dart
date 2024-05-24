import 'package:flutter/material.dart';
import '../controller/news_controller.dart';
import '../model/news.dart';
import 'news_details_screen.dart';

class LocalNewsScreen extends StatefulWidget {
  @override
  _LocalNewsScreenState createState() => _LocalNewsScreenState();
}

class _LocalNewsScreenState extends State<LocalNewsScreen> {
  final NewsController _newsController = NewsController();
  late Future<List<News>> _newsFuture;

  @override
  void initState() {
    super.initState();
    _newsFuture = _newsController.getNewsFromHive();
  }

  Future<void> _refreshNews() async {
    setState(() {
      _newsFuture = _newsController.getNewsFromHive();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local News'),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshNews,
        child: FutureBuilder<List<News>>(
          future: _newsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              List<News>? newsList = snapshot.data;
              if (newsList == null || newsList.isEmpty) {
                return const Center(
                  child: Text('No local news available'),
                );
              }

              return ListView.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) {
                  News news = newsList[index];
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () async {
                                await _newsController.deleteNewsFromHive(news.id);
                                _refreshNews();
                              },
                              child: const Text('Delete'),
                            ),
                            const SizedBox(width: 8), // Добавляем небольшой отступ между кнопками
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
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
