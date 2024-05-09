class Comment {
  final String text;
  final String username;
  final String newsId;

  Comment({
    required this.text,
    required this.username,
    required this.newsId,
  });

  // Factory method to parse JSON data into a Comment object
  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      text: json['text'] ?? '',
      username: json['username'] ?? '',
      newsId: json['newsId'] ?? '',
    );
  }

  // Method to convert the comment object to a JSON format
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'username': username,
      'newsId': newsId,
    };
  }
}
