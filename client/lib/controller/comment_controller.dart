import '../model/comment.dart';

class CommentController {
  List<Comment> getCommentList() {
    return [
      Comment('Comment 1'),
      Comment('Comment 2'),
      Comment('Comment 3'),
    ];
  }
}