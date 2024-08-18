import 'package:common/common.dart';
import 'package:core/feature/task/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'section.g.dart';

@JsonSerializable()
class SectionEntity implements ToModel<Section> {
  SectionEntity({
    this.id,
    this.projectId,
    this.order,
    this.name,
  });

  factory SectionEntity.fromJson(Map<String, dynamic> json) =>
      _$SectionEntityFromJson(json);

  final String? id;
  final String? projectId;
  final int? order;
  final String? name;

  Map<String, dynamic> toJson() => _$SectionEntityToJson(this);

  @override
  Section toModel() => Section(
        id: id,
        projectId: projectId,
        order: order,
        name: name,
      );
}
