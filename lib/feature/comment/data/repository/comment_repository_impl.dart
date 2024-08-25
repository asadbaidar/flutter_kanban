import 'package:common/common.dart';
import 'package:core/feature/comment/comment.dart';

class CommentRepositoryImpl implements CommentRepository {
  CommentRepositoryImpl({required this.dataSource});

  final CommentRemoteDataSource dataSource;

  @override
  Future<List<Comment>> getComments({String? taskId, String? projectId}) {
    return dataSource
        .getComments(taskId: taskId, projectId: projectId)
        .then($mapToModels);
  }

  @override
  Future<Comment> createComment(Comment dto) {
    return dataSource
        .createComment(CommentEntity.fromModel(dto))
        .then($mapToModel);
  }
}
