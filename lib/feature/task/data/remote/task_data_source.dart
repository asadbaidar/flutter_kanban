import 'package:core/feature/task/data/data.dart';

abstract class TaskRemoteDataSource {
  Future<TaskDataEntity> getTasks(String projectId);
  Future<TaskEntity> createTask(TaskDtoEntity dto);
  Future<TaskEntity> updateTask(String id, TaskDtoEntity dto);
  Future<void> moveTask({String? id, String? sectionId});
}
