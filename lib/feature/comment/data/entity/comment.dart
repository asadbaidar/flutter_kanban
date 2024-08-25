import 'package:common/common.dart';
import 'package:core/feature/comment/domain/domain.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class CommentEntity implements ToModel<Comment> {
  CommentEntity({
    this.content,
    this.id,
    this.postedAt,
    this.projectId,
    this.taskId,
    this.attachment,
  });

  factory CommentEntity.fromJson(Map<String, dynamic> json) =>
      _$CommentEntityFromJson(json);

  factory CommentEntity.fromModel(Comment model) => CommentEntity(
        content: model.content,
        id: model.id,
        postedAt: model.postedAt?.toUtc().toIso8601String(),
        projectId: model.projectId,
        taskId: model.taskId,
        attachment: $mapTo(model.attachment, AttachmentEntity.fromModel),
      );

  final String? content;
  final String? id;
  final String? postedAt;
  final String? projectId;
  final String? taskId;
  final AttachmentEntity? attachment;

  Map<String, dynamic> toJson() => _$CommentEntityToJson(this).nonBlankValues;

  @override
  Comment toModel() => Comment(
        content: content,
        id: id,
        postedAt: DateTime.tryParse(postedAt ?? '')?.toLocal(),
        projectId: projectId,
        taskId: taskId,
        attachment: attachment?.toModel(),
      );
}

@JsonSerializable()
class AttachmentEntity implements ToModel<Attachment> {
  AttachmentEntity({
    this.fileName,
    this.fileType,
    this.fileUrl,
    this.resourceType,
  });

  factory AttachmentEntity.fromJson(Map<String, dynamic> json) =>
      _$AttachmentEntityFromJson(json);

  factory AttachmentEntity.fromModel(Attachment model) => AttachmentEntity(
        fileName: model.fileName,
        fileType: model.fileType,
        fileUrl: model.fileUrl,
        resourceType: model.resourceType,
      );

  final String? fileName;
  final String? fileType;
  final String? fileUrl;
  final String? resourceType;

  Map<String, dynamic> toJson() => _$AttachmentEntityToJson(this);

  @override
  Attachment toModel() => Attachment(
        fileName: fileName,
        fileType: fileType,
        fileUrl: fileUrl,
        resourceType: resourceType,
      );
}
