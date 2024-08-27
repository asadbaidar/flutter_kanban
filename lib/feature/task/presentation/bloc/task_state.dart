import 'package:common/common.dart';
import 'package:core/feature/project/domain/domain.dart';
import 'package:core/feature/task/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_state.freezed.dart';

typedef TaskDataState = Data<TaskData>;
typedef TaskMoveState = Data<void>;

@freezed
class TaskState with _$TaskState {
  const factory TaskState({
    @Default(TaskDataState()) TaskDataState dataState,
    @Default(TaskMoveState()) TaskMoveState moveState,
    Project? project,
    Task? draggingTask,
    Task? movingTask,
  }) = _TaskState;
}

extension TaskStateValues on TaskState {
  String get projectId => project?.id ?? '';

  SectionTasks get sectionTasks => dataState.value?.all ?? {};

  bool isTaskMoveing(Task task) =>
      moveState.key == task.id && moveState.isLoading;
}

extension TaskUpdateState on SectionTasks {
  SectionTasks removeTask(Task task, {String? fromSection}) {
    final update = {...this};
    final sectionId = fromSection ?? task.sectionId ?? '';
    final section = [...?update[sectionId]];
    section.removeWhere((t) => t.id == task.id);
    update[sectionId] = section;
    return update;
  }

  SectionTasks addTask(Task task, {String? toSection}) {
    final update = {...this};
    final sectionId = toSection ?? task.sectionId ?? '';
    final section = [...?update[sectionId]];
    section.add(task.copyWith(sectionId: sectionId));
    update[sectionId] = section;
    return update;
  }

  Task? getById(String? id) => values.fold<Task?>(
        null,
        (task, tasks) => task ?? tasks.firstWhereOrNull((t) => t.id == id),
      );
}
