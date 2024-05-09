class Comment {
  constructor(id, text, newsId, username = "anonymous") {
    this.id = id;
    this.text = text;
    this.newsId = newsId;
    this.username = username;
  }
}

module.exports = Comment;