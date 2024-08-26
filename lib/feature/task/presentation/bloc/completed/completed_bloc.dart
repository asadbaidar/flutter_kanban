import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:core/feature/project/domain/domain.dart';
import 'package:core/feature/task/task.dart';

class TaskCompletedBloc extends Cubit<TaskCompletedState> with SafeBloc {
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
    if (project == null || state.project == project) return;

    emit(state.copyWith(project: project));
    getCompletedTasks();
  }
}

extension TaskOpenCloseBloc on TaskCompletedBloc {
  Future<void> reopenTask(String id) => when(
        state.reopenState.copyWith(key: id),
        act: () => taskRepository.reopenTask(id),
        emit: (value) => emit(state.copyWith(reopenState: value)),
      );

  Future<void> closeTask(String id) => when(
        state.closeState.copyWith(key: id),
        act: () => taskRepository.closeTask(id),
        emit: (value) => emit(state.copyWith(closeState: value)),
      );
}
