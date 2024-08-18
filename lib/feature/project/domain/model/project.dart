import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';

@freezed
class Project with _$Project {
  const factory Project({
   String? id,
   String? name,
   int? commentCount,
   int? order,
   String? color,
   bool? isShared,
   bool? isFavorite,
   bool? isInboxProject,
   bool? isTeamInbox,
   String? viewStyle,
   String? url,
   String? parentId,
  }) = _Project;
}
