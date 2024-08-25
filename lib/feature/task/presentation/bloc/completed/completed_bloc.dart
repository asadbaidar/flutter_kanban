import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:core/feature/project/domain/domain.dart';
import 'package:core/feature/task/task.dart';

class TaskCompletedBloc extends Cubit<TaskCompletedState> {
  TaskCompletedBloc({required this.taskRepository})
      : super(const TaskCompletedState());

  final TaskRepository taskRepository;

  Future<void> getCompletedTasks() => when(
        state.dataState,
        act: () => taskRepository.getCompletedTasks(state.projectId),
        emit: (value) => emit(state.copyWith(dataState: value)),
        onLoaded: (data) => emit(state.copyWith(dataState: data.sorted())),
      );

  void projectChanged(Project? project) {
    if (project == null) return;
    final previous = state.project;

    emit(state.copyWith(project: project));

    if (previous != project) getCompletedTasks();
  }
}
