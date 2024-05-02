import 'package:flutter/material.dart';
import '../controller/news_controller.dart';
import '../model/news.dart';
import '../model/comment.dart'; // Import the Comment model
import '../view/jojo_drawer.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewsListScreenState createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  final NewsController _newsController = NewsController();
  final Map<String, List<Comment>> commentsMap = {}; // Map to store comments for each news post
  final Map<String, TextEditingController> commentControllersMap = {}; // Map to store controllers for each news post
  final Map<String, bool> showAllCommentsMap = {}; // Map to track whether to show all comments or not

  @override
  Widget build(BuildContext context) {
    List<News> newsList = _newsController.getNewsList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('JoJo Wiki Development News'),
      ),
      drawer: const JoJoDrawer(),
      body: ListView.builder(
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          News news = newsList[index];
          if (!commentControllersMap.containsKey(news.title)) {
            commentControllersMap[news.title] = TextEditingController(); // Create a new controller for each news post
          }
          TextEditingController commentController = commentControllersMap[news.title]!;

          // Check if "Show more" link should be displayed
          bool showAllComments = showAllCommentsMap[news.title] ?? false;
          List<Comment> comments = commentsMap[news.title] ?? [];
          List<Comment> displayedComments = showAllComments ? comments : comments.take(2).toList();

          return Card(
            elevation: 4,
            margin: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  news.photoUrl,
                  fit: BoxFit.cover,// Adjust image height as needed
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
                const SizedBox(height: 12.0),
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Comments:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // Display comments
                Column(
                  children: displayedComments.map((comment) {
                    return ListTile(
                      title: Text(comment.text),
                      subtitle: Text('By: ${comment.username}'),
                    );
                  }).toList(),
                ),
                // Show more link
                if (comments.length > 2)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        showAllCommentsMap[news.title] = !showAllComments;
                      });
                    },
                    child: Text(
                      showAllComments ? 'Show less' : 'Show more',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                // Add new comment section
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: commentController, // Use the corresponding controller
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          commentsMap.putIfAbsent(news.title, () => []).add(Comment(value));
                          commentController.clear(); // Clear the input after submitting the comment
                        });
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () {
                          String commentText = commentController.text.trim();
                          if (commentText.isNotEmpty) {
                            setState(() {
                              commentsMap.putIfAbsent(news.title, () => []).add(Comment(commentText));
                              commentController.clear(); // Clear the input after sending the comment
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // Dispose all controllers when the screen is disposed
    for (var controller in commentControllersMap.values) {
      controller.dispose();
    }
    super.dispose();
  }
}
