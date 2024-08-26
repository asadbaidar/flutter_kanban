import 'package:common/utils/utils.dart';
import 'package:core/feature/task/data/data.dart';
import 'package:core/feature/task/domain/domain.dart';

class TaskRepositoryImpl implements TaskRepository {
  const TaskRepositoryImpl({required this.dataSource});

  final TaskRemoteDataSource dataSource;

  @override
  Future<TaskData> getTasks(String projectId) {
    return dataSource.getTasks(projectId).then($mapToModel);
  }

  @override
  Future<List<TaskCompleted>> getCompletedTasks(String projectId) {
    return dataSource.getCompletedTasks(projectId).then($mapToModels);
  }

  @override
  Future<Task> createTask(TaskDto dto) {
    return dataSource
        .createTask(TaskDtoEntity.fromModel(dto))
        .then($mapToModel);
  }

  @override
  Future<Task> updateTask(String id, TaskDto dto) {
    return dataSource
        .updateTask(id, TaskDtoEntity.fromModel(dto))
        .then($mapToModel);
  }

  @override
  Future<void> moveTask({String? id, String? sectionId}) {
    return dataSource.moveTask(id: id, sectionId: sectionId);
  }

  @override
  Future<void> closeTask(String id) {
    return dataSource.closeTask(id);
  }

  @override
  Future<void> reopenTask(String id) {
    return dataSource.reopenTask(id);
  }
}
