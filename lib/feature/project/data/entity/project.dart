import 'package:common/common.dart';
import 'package:core/feature/project/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

@JsonSerializable()
class ProjectEntity implements ToModel<Project> {
  ProjectEntity({
    this.id,
    this.name,
    this.commentCount,
    this.order,
    this.color,
    this.isShared,
    this.isFavorite,
    this.isInboxProject,
    this.isTeamInbox,
    this.viewStyle,
    this.url,
    this.parentId,
  });

  factory ProjectEntity.fromJson(Map<String, dynamic> json) =>
      _$ProjectEntityFromJson(json);

  final String? id;
  final String? name;
  final int? commentCount;
  final int? order;
  final String? color;
  final bool? isShared;
  final bool? isFavorite;
  final bool? isInboxProject;
  final bool? isTeamInbox;
  final String? viewStyle;
  final String? url;
  final String? parentId;

  Map<String, dynamic> toJson() => _$ProjectEntityToJson(this);
  
  @override
  Project toModel() => Project(
      id: id,
      name: name,
      commentCount: commentCount,
      order: order,
      color: color,
      isShared: isShared,
      isFavorite: isFavorite,
      isInboxProject: isInboxProject,
      isTeamInbox: isTeamInbox,
      viewStyle: viewStyle,
      url: url,
      parentId: parentId,
    );
}
