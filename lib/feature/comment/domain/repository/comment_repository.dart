import 'package:core/feature/comment/comment.dart';

abstract class CommentRepository {
  Future<List<Comment>> getComments({String? taskId, String? projectId});
  Future<Comment> createComment(Comment dto);
}
