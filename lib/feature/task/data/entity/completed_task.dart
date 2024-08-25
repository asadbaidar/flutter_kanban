import 'package:common/common.dart';
import 'package:core/feature/task/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'completed_task.g.dart';

@JsonSerializable()
class CompletedTaskEntity implements ToModel<CompletedTask> {
  CompletedTaskEntity({
    this.completedAt,
    this.content,
    this.projectId,
    this.sectionId,
    this.taskId,
  });

  factory CompletedTaskEntity.fromJson(Map<String, dynamic> json) =>
      _$CompletedTaskEntityFromJson(json);

  final String? completedAt;
  final String? content;
  final String? projectId;
  final String? sectionId;
  final String? taskId;

  @override
  CompletedTask toModel() {
    return CompletedTask(
      completedAt: DateTime.tryParse(completedAt ?? ''),
      content: content,
      projectId: projectId,
      sectionId: sectionId,
      taskId: taskId,
    );
  }
}
