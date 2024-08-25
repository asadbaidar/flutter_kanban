import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:core/feature/project/domain/domain.dart';
import 'package:core/feature/task/task.dart';

class TaskBloc extends Cubit<TaskState> with SafeBloc {
  TaskBloc({required this.taskRepository}) : super(const TaskState());

  final TaskRepository taskRepository;

  Future<void> getTasks() => when(
        state.taskDataState,
        act: () => taskRepository.getTasks(state.projectId),
        emit: (value) => emit(state.copyWith(taskDataState: value)),
      );

  void projectChanged(Project? project) {
    if (project == null) return;
    final previous = state.project;

    emit(state.copyWith(project: project));

    if (previous != project) getTasks();
  }
}

extension TaskUpdateBloc on TaskBloc {
  void addTask(Task task) {
    emit(
      state.copyWith(
        taskDataState: state.taskDataState.copyWith(
          value: TaskData(all: state.sectionTasks.addTask(task)),
        ),
      ),
    );
  }

  void updateTask(Task task) {
    emit(
      state.copyWith(
        taskDataState: state.taskDataState.copyWith(
          value: TaskData(
            all: state.sectionTasks.removeTask(task).addTask(task),
          ),
        ),
      ),
    );
  }

  Future<void> moveTask(Task task, {required String toSection}) async {
    final taskId = task.id!;
    final targetSectionId = toSection;
    final backup = state.sectionTasks;

    final update = state.sectionTasks
        .removeTask(task)
        .addTask(task, toSection: targetSectionId);

    emit(
      state.copyWith(
        taskDataState: state.taskDataState.copyWith(
          value: TaskData(all: update),
        ),
        taskMoveState: Data.loading(key: taskId),
      ),
    );
    try {
      await taskRepository.moveTask(id: taskId, sectionId: targetSectionId);
      emit(
        state.copyWith(
          taskMoveState: state.taskMoveState.toLoaded(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          taskDataState: state.taskDataState.copyWith(
            value: TaskData(all: backup),
          ),
          taskMoveState: state.taskMoveState.toFailure(error: e),
        ),
      );
    }
  }

  void onDragStart(Task task) {
    emit(state.copyWith(draggingTask: task));
  }

  void onDragEnd() {
    emit(state.copyWith(draggingTask: null));
  }
}
