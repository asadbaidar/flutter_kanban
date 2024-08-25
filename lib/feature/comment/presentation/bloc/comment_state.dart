import 'package:common/common.dart';
import 'package:core/feature/comment/comment.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_state.freezed.dart';

typedef CommentDataState = Data<List<Comment>>;
typedef CommentSubmitState = Data<Comment>;

@freezed
class CommentState with _$CommentState {
  const factory CommentState({
    @Default(CommentDataState()) CommentDataState dataState,
    @Default(CommentSubmitState()) CommentSubmitState submitState,
    @Default(TextInput.pure()) TextInput content,
    String? taskId,
    String? projectId,
  }) = _CommentState;
}

extension CommentStateValues on CommentState {
  List<Comment> get comments => dataState.value ?? [];
}

extension CommentStateToDto on CommentState {
  Comment toDto() {
    return Comment(
      content: content.value,
      taskId: taskId,
      projectId: projectId,
    );
  }
}

extension CommentUpdateState on CommentDataState {
  CommentDataState addComment(Comment comment) {
    if (value == null) return this;
    return copyWith(value: List<Comment>.from(value!)..insert(0, comment));
  }

  CommentDataState sorted() {
    if (value == null) return this;
    return copyWith(value: value!.sorted(commentsByRecent));
  }
}
