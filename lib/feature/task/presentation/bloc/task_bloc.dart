import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:core/feature/project/domain/domain.dart';
import 'package:core/feature/task/task.dart';

class TaskBloc extends Cubit<TaskState> {
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

  void onDragStart(Task task) {
    emit(state.copyWith(draggingTask: task));
  }

  void onDragEnd() {
    emit(state.copyWith(draggingTask: null));
  }

  Future<void> moveToSection(Section section, {required Task task}) async {
    final sourceSectionId = task.sectionId!;
    final targetSectionId = section.id!;
    final taskId = task.id!;
    final backup = state.sectionTasks;

    final update = {...state.sectionTasks};
    final sourceSection = update[sourceSectionId] ?? [];
    final targetSection = update[targetSectionId] ?? [];
    if (sourceSection.isEmpty) return;

    sourceSection.remove(task);
    targetSection.add(task.copyWith(sectionId: targetSectionId));
    update[sourceSectionId] = sourceSection;
    update[targetSectionId] = targetSection;

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
}
