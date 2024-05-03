import 'package:flutter/material.dart';
import '../model/news.dart';
import '../model/comment.dart';

class NewsDetailsScreen extends StatefulWidget {
  final News news;

  const NewsDetailsScreen({super.key, required this.news});

  @override
  // ignore: library_private_types_in_public_api
  _NewsDetailsScreenState createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  final TextEditingController commentController = TextEditingController();
  final Map<String, List<Comment>> commentsMap = {}; // Map to store comments for each news post
  final Map<String, TextEditingController> commentControllersMap = {}; // Map to store controllers for each news post
  final Map<String, bool> showAllCommentsMap = {}; // Map to track whether to show all comments or not

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "JoJo",
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'JoJoFont',
            fontWeight: FontWeight.bold,
          )
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.news.photoUrl,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            Text(
              widget.news.mainText,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Comments:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Display comments
            Column(
              children: [
                // Show first two comments by default
                ...((commentsMap[widget.news.title] ?? []).take(2).map((comment) {
                  return ListTile(
                    title: Text(comment.text),
                    subtitle: Text('By: ${comment.username}'),
                  );
                }).toList()),
                // Show additional comments if "Show more" is pressed
                if (showAllCommentsMap[widget.news.title] ?? false)
                  ...((commentsMap[widget.news.title] ?? []).skip(2).map((comment) {
                    return ListTile(
                      title: Text(comment.text),
                      subtitle: Text('By: ${comment.username}'),
                    );
                  }).toList()),
                // Show more link
                if ((commentsMap[widget.news.title]?.length ?? 0) > 2)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        showAllCommentsMap[widget.news.title] = !(showAllCommentsMap[widget.news.title] ?? false);
                      });
                    },
                    child: Text(
                      showAllCommentsMap[widget.news.title] ?? false ? 'Show less' : 'Show more',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12.0),
            // Add new comment section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: commentController, // Use the corresponding controller
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    setState(() {
                      commentsMap.putIfAbsent(widget.news.title, () => []).add(Comment(value));
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
                          commentsMap.putIfAbsent(widget.news.title, () => []).add(Comment(commentText));
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
      ),
    );
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }
}
