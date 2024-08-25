import 'package:common/common.dart';
import 'package:core/feature/comment/comment.dart';

class CommentRemoteDataSourceImpl implements CommentRemoteDataSource {
  CommentRemoteDataSourceImpl({required this.httpClient});

  final HttpClient httpClient;

  @override
  Future<List<CommentEntity>> getComments({String? taskId, String? projectId}) {
    return httpClient.get<JsonArray>(
      path: CommentEndpoints.comments,
      query: {
        'task_id': taskId,
        'project_id': projectId,
      },
    ).then((json) => json.mapJsonArray(CommentEntity.fromJson) ?? []);
  }

  @override
  Future<CommentEntity> createComment(CommentEntity dto) {
    return httpClient
        .post<JsonObject>(
          path: CommentEndpoints.comments,
          body: dto.toJson(),
        )
        .then(CommentEntity.fromJson);
  }
}
