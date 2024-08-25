import 'package:core/feature/task/task.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_dto.freezed.dart';

@freezed
class TaskDto with _$TaskDto {
  const factory TaskDto({
    String? content,
    String? description,
    String? sectionId,
    List<String>? labels,
    int? priority,
    String? dueString,
    String? dueDate,
    DateTime? dueDatetime,
    String? assigneeId,
    String? duration,
    DurationUnit? durationUnit,
  }) = _TaskDto;
}
