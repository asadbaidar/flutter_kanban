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
    @Default(TaskDataState()) TaskDataState taskDataState,
    @Default(TaskMoveState()) TaskMoveState taskMoveState,
    Project? project,
    Task? draggingTask,
    Task? movingTask,
  }) = _TaskState;
}

extension TaskStateValues on TaskState {
  String get projectId => project?.id ?? '';

  SectionTasks get sectionTasks => taskDataState.value?.all ?? {};

  bool isMoveInProgress(Task task) =>
      taskMoveState.key == task.id && taskMoveState.isLoading;
}
