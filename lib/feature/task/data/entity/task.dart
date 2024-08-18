import 'package:common/common.dart';
import 'package:core/feature/task/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class TaskEntity implements ToModel<Task> {
  TaskEntity({
    this.creatorId,
    this.createdAt,
    this.assigneeId,
    this.assignerId,
    this.commentCount,
    this.isCompleted,
    this.content,
    this.description,
    this.due,
    this.duration,
    this.id,
    this.labels,
    this.order,
    this.priority,
    this.projectId,
    this.sectionId,
    this.parentId,
    this.url,
  });

  factory TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityFromJson(json);

  final String? creatorId;
  final String? createdAt;
  final String? assigneeId;
  final String? assignerId;
  final int? commentCount;
  final bool? isCompleted;
  final String? content;
  final String? description;
  final DueEntity? due;
  final DurationEntity? duration;
  final String? id;
  final List<String>? labels;
  final int? order;
  final int? priority;
  final String? projectId;
  final String? sectionId;
  final String? parentId;
  final String? url;

  Map<String, dynamic> toJson() => _$TaskEntityToJson(this);

  @override
  Task toModel() => Task(
        creatorId: creatorId,
        createdAt: createdAt,
        assigneeId: assigneeId,
        assignerId: assignerId,
        commentCount: commentCount,
        isCompleted: isCompleted,
        content: content,
        description: description,
        due: due?.toModel(),
        duration: duration?.toModel(),
        id: id,
        labels: labels,
        order: order,
        priority: priority,
        projectId: projectId,
        sectionId: sectionId,
        parentId: parentId,
        url: url,
      );
}

@JsonSerializable()
class DueEntity implements ToModel<Due> {
  DueEntity({
    this.date,
    this.isRecurring,
    this.datetime,
    this.string,
    this.timezone,
  });

  factory DueEntity.fromJson(Map<String, dynamic> json) =>
      _$DueEntityFromJson(json);

  final String? date;
  final bool? isRecurring;
  final String? datetime;
  final String? string;
  final String? timezone;

  Map<String, dynamic> toJson() => _$DueEntityToJson(this);

  @override
  Due toModel() => Due(
        date: date,
        isRecurring: isRecurring,
        datetime: datetime,
        string: string,
        timezone: timezone,
      );
}

@JsonSerializable()
class DurationEntity implements ToModel<Duration> {
  DurationEntity({
    this.amount,
    this.unit,
  });

  factory DurationEntity.fromJson(Map<String, dynamic> json) =>
      _$DurationEntityFromJson(json);

  final int? amount;
  final String? unit;

  Map<String, dynamic> toJson() => _$DurationEntityToJson(this);

  @override
  Duration toModel() => Duration(
        amount: amount,
        unit: unit,
      );
}
