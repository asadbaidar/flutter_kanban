import 'package:core/feature/task/data/data.dart';
import 'package:core/feature/task/task.dart';

abstract class TaskRemoteDataSource {
  Future<TaskDataEntity> getTasks(String projectId);
  Future<List<CompletedTaskEntity>> getCompletedTasks(String projectId);

  Future<TaskEntity> createTask(TaskDtoEntity dto);
  Future<TaskEntity> updateTask(String id, TaskDtoEntity dto);
  Future<void> moveTask({String? id, String? sectionId});

  Future<void> closeTask(String id);
  Future<void> reopenTask(String id);
}
