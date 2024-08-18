import 'package:freezed_annotation/freezed_annotation.dart';

part 'task.freezed.dart';

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
    Due? due,
    Duration? duration,
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
class Due with _$Due {
  const factory Due({
    String? date,
    bool? isRecurring,
    String? datetime,
    String? string,
    String? timezone,
  }) = _Due;
}

@freezed
class Duration with _$Duration {
  const factory Duration({
    int? amount,
    String? unit,
  }) = _Duration;
}
