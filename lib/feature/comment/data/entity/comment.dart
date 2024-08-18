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

  final String? content;
  final String? id;
  final String? postedAt;
  final String? projectId;
  final String? taskId;
  final AttachmentEntity? attachment;

  Map<String, dynamic> toJson() => _$CommentEntityToJson(this);

  @override
  Comment toModel() => Comment(
        content: content,
        id: id,
        postedAt: postedAt,
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
