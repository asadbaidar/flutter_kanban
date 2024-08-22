import 'package:core/feature/task/domain/domain.dart';

abstract class TaskRepository {
  Future<TaskData> getTasks(String projectId);
  Future<Task> createTask(TaskDto dto);
  Future<Task> updateTask(String id, TaskDto dto);
  Future<void> moveTask({String? id, String? sectionId});
}
