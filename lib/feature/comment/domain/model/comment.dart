import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment.freezed.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    String? content,
    String? id,
    String? postedAt,
    String? projectId,
    String? taskId,
    Attachment? attachment,
  }) = _Comment;
}

@freezed
class Attachment with _$Attachment {
  const factory Attachment({
    String? fileName,
    String? fileType,
    String? fileUrl,
    String? resourceType,
  }) = _Attachment;
}
