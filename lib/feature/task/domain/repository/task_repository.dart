import 'package:core/feature/task/domain/domain.dart';

abstract class TaskRepository {
  Future<TaskData> getTasks(String projectId);
  Future<List<CompletedTask>> getCompletedTasks(String projectId);

  Future<Task> createTask(TaskDto dto);
  Future<Task> updateTask(String id, TaskDto dto);
  Future<void> moveTask({String? id, String? sectionId});

  Future<void> closeTask(String id);
  Future<void> reopenTask(String id);
}
