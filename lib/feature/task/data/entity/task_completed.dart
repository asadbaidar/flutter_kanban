import 'package:common/common.dart';
import 'package:core/feature/task/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task_completed.g.dart';

@JsonSerializable()
class TaskCompletedEntity implements ToModel<TaskCompleted> {
  TaskCompletedEntity({
    this.completedAt,
    this.content,
    this.projectId,
    this.sectionId,
    this.taskId,
  });

  factory TaskCompletedEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskCompletedEntityFromJson(json);

  final String? completedAt;
  final String? content;
  final String? projectId;
  final String? sectionId;
  final String? taskId;

  Map<String, dynamic> toJson() => _$TaskCompletedEntityToJson(this);

  @override
  TaskCompleted toModel() {
    return TaskCompleted(
      completedAt: DateTime.tryParse(completedAt ?? '')?.toLocal(),
      content: content,
      projectId: projectId,
      sectionId: sectionId,
      taskId: taskId,
    );
  }
}
