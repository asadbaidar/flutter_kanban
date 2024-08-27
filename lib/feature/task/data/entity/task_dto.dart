import 'package:common/common.dart';
import 'package:core/feature/task/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_dto.g.dart';

@JsonSerializable()
class TaskDtoEntity {
  const TaskDtoEntity({
    this.content,
    this.description,
    this.sectionId,
    this.labels,
    this.priority,
    this.dueString,
    this.dueDate,
    this.dueDatetime,
    this.assigneeId,
    this.duration,
    this.durationUnit,
  });

  factory TaskDtoEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskDtoEntityFromJson(json);

  factory TaskDtoEntity.fromModel(TaskDto model) {
    return TaskDtoEntity(
      content: model.content,
      description: model.description,
      sectionId: model.sectionId,
      labels: model.labels,
      priority: model.priority,
      dueString: model.dueString,
      dueDate: model.dueDate,
      dueDatetime: model.dueDatetime?.toUtc().toIso8601String(),
      assigneeId: model.assigneeId,
      duration: model.duration?.toIntOrNull(),
      durationUnit: model.durationUnit?.name,
    );
  }

  final String? content;
  final String? description;
  final String? sectionId;
  final List<String>? labels;
  final int? priority;
  final String? dueString;
  final String? dueDate;
  final String? dueDatetime;
  final String? assigneeId;
  final int? duration;
  final String? durationUnit;

  Map<String, dynamic> toJson() => _$TaskDtoEntityToJson(this);
}
