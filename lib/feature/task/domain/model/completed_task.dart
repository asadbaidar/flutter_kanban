import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'completed_task.freezed.dart';

@freezed
class CompletedTask with _$CompletedTask {
  const factory CompletedTask({
    DateTime? completedAt,
    String? content,
    String? projectId,
    String? sectionId,
    String? taskId,
  }) = _CompletedTask;
}

extension CompletedAtFormat on CompletedTask {
  String get completedAtFormmated =>
      'Completed at ${completedAt?.formatMMMdyHma}';
}

int taskByCompletion(CompletedTask a, CompletedTask b) {
  if (a.completedAt == null || b.completedAt == null) {
    return 0;
  }
  return b.completedAt!.compareTo(a.completedAt!);
}
