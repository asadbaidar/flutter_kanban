import 'package:freezed_annotation/freezed_annotation.dart';

part 'task_dto.freezed.dart';

@freezed
class TaskDto with _$TaskDto {
  const factory TaskDto({
    String? content,
    String? description,
    String? sectionId,
    int? order,
    List<String>? labels,
    int? priority,
    String? dueString,
    String? dueDate,
    String? dueDatetime,
    String? dueLang,
    String? assigneeId,
    int? duration,
    String? durationUnit,
  }) = _TaskDto;
}
