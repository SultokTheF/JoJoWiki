import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  List<Comment> commentsList = [];

  @override
  void initState() {
    super.initState();
    loadComments();
  }

  Future<void> loadComments() async {
    final response = await http.get(Uri.parse('https://jojowiki.onrender.com/comments/news/${widget.news.id}'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      setState(() {
        commentsList = jsonResponse.map((json) => Comment.fromJson(json)).toList();
      });
    } else {
      throw Exception('Failed to load comments');
    }
  }

  Future<void> postComment() async {
    final Comment newComment = Comment(
      text: commentController.text,
      username: 'sultok', // Assuming you want to use a fixed username for posting comments
      newsId: widget.news.id,
    );

    final response = await http.post(
      Uri.parse('https://jojowiki.onrender.com/comments'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(newComment.toJson()),
    );

    if (response.statusCode == 201) {
      // Comment posted successfully, reload comments
      await loadComments();
      commentController.clear(); // Clear the input after posting the comment
    } else {
      throw Exception('Failed to post comment');
    }
  }

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
          ),
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
                // Show all comments
                ...commentsList.map((comment) {
                  return ListTile(
                    title: Text(comment.text),
                    subtitle: Text('By: ${comment.username}'),
                  );
                }),
              ],
            ),
            const SizedBox(height: 12.0),
            // Add new comment section
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: commentController,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    postComment(); // Call postComment when submitting the comment
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Add a comment...',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      String commentText = commentController.text.trim();
                      if (commentText.isNotEmpty) {
                        postComment(); // Call postComment when sending the comment
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
