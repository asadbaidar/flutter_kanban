import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_completed.freezed.dart';

@freezed
class TaskCompleted with _$TaskCompleted {
  const factory TaskCompleted({
    DateTime? completedAt,
    String? content,
    String? projectId,
    String? sectionId,
    String? taskId,
  }) = _CompletedTask;
}

extension CompletedAtFormat on TaskCompleted {
  String get completedAtFormmated =>
      'Completed at ${completedAt?.formatMMMdyHma}';
}

int taskByCompletion(TaskCompleted a, TaskCompleted b) {
  if (a.completedAt == null || b.completedAt == null) {
    return 0;
  }
  return b.completedAt!.compareTo(a.completedAt!);
}
