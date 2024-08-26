import 'package:common/common.dart';
import 'package:core/feature/project/domain/domain.dart';
import 'package:core/feature/task/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'completed_state.freezed.dart';

typedef TaskCompletedDataState = Data<List<TaskCompleted>>;
typedef TaskActionState = Data<void>;

@freezed
class TaskCompletedState with _$TaskCompletedState {
  const factory TaskCompletedState({
    @Default(TaskCompletedDataState()) TaskCompletedDataState dataState,
    @Default(TaskActionState()) TaskActionState reopenState,
    @Default(TaskActionState()) TaskActionState closeState,
    Project? project,
  }) = _TaskCompletedState;
}

extension TaskCompletedStateValues on TaskCompletedState {
  String get projectId => project?.id ?? '';

  List<TaskCompleted> get tasks => dataState.value ?? [];

  bool isTaskReopening(String id) =>
      reopenState.key == id && reopenState.isLoading;

  bool isTaskClosing(String id) => closeState.key == id && closeState.isLoading;
}

extension GetCompletedTaskById on List<TaskCompleted> {
  TaskCompleted? getById(String? id) =>
      firstWhereOrNull((element) => element.taskId == id);
}

extension SortData on TaskCompletedDataState {
  TaskCompletedDataState sorted() =>
      copyWith(value: value?.sorted(taskByCompletion));
}
