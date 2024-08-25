import 'package:common/common.dart';
import 'package:core/feature/comment/comment.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentBloc extends Cubit<CommentState> with SafeBloc {
  CommentBloc({
    required this.commentRepository,
    String? taskId,
    String? projectId,
  }) : super(CommentState(taskId: taskId, projectId: projectId));

  final CommentRepository commentRepository;

  Future<void> getComments() {
    return when(
      state.dataState,
      act: () => commentRepository.getComments(
        taskId: state.taskId,
        projectId: state.projectId,
      ),
      emit: (data) => emit(state.copyWith(dataState: data)),
      onLoaded: (data) => emit(
        state.copyWith(dataState: data.sorted()),
      ),
    );
  }

  Future<void> createComment() {
    return when(
      state.submitState,
      act: () => commentRepository.createComment(state.toDto()),
      emit: (data) => emit(state.copyWith(submitState: data)),
      onLoaded: (data) => emit(
        state.copyWith(
          submitState: data,
          dataState: state.dataState.addComment(data.value!),
        ),
      ),
    );
  }
}

extension CommentFormBloc on CommentBloc {
  void contentChanged(String value) {
    final content = value.toTextInput();
    emit(state.copyWith(content: content));
  }

  void reset() {
    emit(
      state.copyWith(
        content: const TextInput.pure(),
        submitState: const Data(),
      ),
    );
  }
}
