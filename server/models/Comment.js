class Comment {
  constructor(id, text, username = "anonymous") {
    this.id = id;
    this.text = text;
    this.username = username
  }
}

module.exports = Comment;