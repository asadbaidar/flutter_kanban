import 'package:common/common.dart';
import 'package:core/feature/task/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

class TaskDataEntity implements ToModel<TaskData> {
  TaskDataEntity({this.all});

  factory TaskDataEntity.fromJson(JsonArray json) {
    return TaskDataEntity(all: json.mapJsonArray(TaskEntity.fromJson));
  }

  final List<TaskEntity>? all;

  JsonArray toJson() => all?.map((e) => e.toJson()).toList() ?? [];

  @override
  TaskData toModel() {
    return TaskData(
      all: all?.groupFoldBy(
        (e) => e.sectionId ?? '',
        (previous, e) => (previous ?? [])..add(e.toModel()),
      ),
    );
  }
}

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
  final TaskDueEntity? due;
  final TaskDurationEntity? duration;
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
class TaskDueEntity implements ToModel<TaskDue> {
  TaskDueEntity({
    this.date,
    this.isRecurring,
    this.datetime,
    this.string,
    this.timezone,
  });

  factory TaskDueEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskDueEntityFromJson(json);

  final String? date;
  final bool? isRecurring;
  final String? datetime;
  final String? string;
  final String? timezone;

  Map<String, dynamic> toJson() => _$TaskDueEntityToJson(this);

  @override
  TaskDue toModel() => TaskDue(
        date: date,
        isRecurring: isRecurring,
        datetime: DateTime.tryParse(datetime ?? '')?.toLocal(),
        string: string,
        timezone: timezone,
      );
}

@JsonSerializable()
class TaskDurationEntity implements ToModel<TaskDuration> {
  TaskDurationEntity({
    this.amount,
    this.unit,
  });

  factory TaskDurationEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskDurationEntityFromJson(json);

  final int? amount;
  final String? unit;

  Map<String, dynamic> toJson() => _$TaskDurationEntityToJson(this);

  @override
  TaskDuration toModel() => TaskDuration(
        amount: amount,
        unit: DurationUnit.fromName(unit),
      );
}
