import 'package:core/feature/comment/comment.dart';

abstract class CommentRemoteDataSource {
  Future<List<CommentEntity>> getComments({String? taskId, String? projectId});
  Future<CommentEntity> createComment(CommentEntity dto);
}
