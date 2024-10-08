import 'package:common/common.dart';
import 'package:core/feature/task/data/data.dart';

class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  TaskRemoteDataSourceImpl({
    required this.httpClient,
    required this.environment,
  });

  final HttpClient httpClient;
  final Environment environment;

  @override
  Future<TaskDataEntity> getTasks(String projectId) {
    return httpClient.get<JsonArray>(
      path: TaskEndpoints.tasks,
      query: {
        'project_id': projectId,
      },
    ).then(TaskDataEntity.fromJson);
  }

  @override
  Future<List<TaskCompletedEntity>> getCompletedTasks(String projectId) {
    return httpClient.post<JsonObject>(
      baseUrl: environment.syncUrl,
      path: TaskEndpoints.completed,
      body: {
        'project_id': projectId,
      },
    ).then(
      (json) =>
          $mapList(
            json['items'],
            (e) => TaskCompletedEntity.fromJson(e as JsonObject),
          ) ??
          [],
    );
  }

  @override
  Future<TaskEntity> createTask(TaskDtoEntity dto) {
    return httpClient
        .post<JsonObject>(
          path: TaskEndpoints.tasks,
          body: dto.toJson(),
        )
        .then(TaskEntity.fromJson);
  }

  @override
  Future<TaskEntity> updateTask(String id, TaskDtoEntity dto) {
    return httpClient
        .post<JsonObject>(
          path: TaskEndpoints.tasks.suffix('/$id'),
          body: dto.toJson(),
        )
        .then(TaskEntity.fromJson);
  }

  @override
  Future<void> moveTask({String? id, String? sectionId}) {
    return httpClient.post(
      baseUrl: environment.syncUrl,
      path: TaskEndpoints.sync,
      formData: SyncCommand(
        type: TaskEndpoints.itemMove,
        args: {
          'id': id,
          'section_id': sectionId,
        },
      ).toFormData(),
    );
  }

  @override
  Future<void> closeTask(String id) {
    return httpClient.post(
      path: TaskEndpoints.close(id),
    );
  }

  @override
  Future<void> reopenTask(String id) {
    return httpClient.post(
      path: TaskEndpoints.reopen(id),
    );
  }
}
