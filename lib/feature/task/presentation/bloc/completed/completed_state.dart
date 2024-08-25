import 'package:common/common.dart';
import 'package:core/feature/project/domain/domain.dart';
import 'package:core/feature/task/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'completed_state.freezed.dart';

typedef TaskCompletedDataState = Data<List<CompletedTask>>;

@freezed
class TaskCompletedState with _$TaskCompletedState {
  const factory TaskCompletedState({
    @Default(TaskCompletedDataState()) TaskCompletedDataState dataState,
    Project? project,
  }) = _TaskCompletedState;
}

extension TaskCompletedStateValues on TaskCompletedState {
  String get projectId => project?.id ?? '';

  List<CompletedTask> get tasks => dataState.value ?? [];
}

extension GetCompletedTaskById on List<CompletedTask> {
  CompletedTask? getById(String? id) =>
      firstWhereOrNull((element) => element.taskId == id);
}

extension SortData on TaskCompletedDataState {
  TaskCompletedDataState sorted() =>
      copyWith(value: value?.sorted(taskByCompletion));
}
