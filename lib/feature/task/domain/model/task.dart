import 'package:common/common.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

typedef SectionTasks = Map<String, List<Task>>;

@freezed
class TaskData with _$TaskData {
  const factory TaskData({
    SectionTasks? all,
  }) = _TaskData;
}

@freezed
class Task with _$Task {
  const factory Task({
    String? creatorId,
    String? createdAt,
    String? assigneeId,
    String? assignerId,
    int? commentCount,
    bool? isCompleted,
    String? content,
    String? description,
    TaskDue? due,
    TaskDuration? duration,
    String? id,
    List<String>? labels,
    int? order,
    int? priority,
    String? projectId,
    String? sectionId,
    String? parentId,
    String? url,
  }) = _Task;
}

@freezed
class TaskDue with _$TaskDue {
  const factory TaskDue({
    String? date,
    bool? isRecurring,
    DateTime? datetime,
    String? string,
    String? timezone,
  }) = _TaskDue;
}

@freezed
class TaskDuration with _$TaskDuration {
  const factory TaskDuration({
    int? amount,
    DurationUnit? unit,
  }) = _TaskDuration;
}

enum DurationUnit {
  minute,
  day,
  ;

  static DurationUnit? fromName(String? value) =>
      DurationUnit.values.byNameOrNull(value);
}
