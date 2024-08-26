import 'package:common/common.dart';
import 'package:core/feature/comment/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentPostButton extends StatelessWidget {
  const CommentPostButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommentBloc, CommentState>(
      listenWhen: (previous, current) =>
          previous.postState != current.postState,
      listener: (context, state) {
        if (state.postState.isLoaded) {
          context.successSnackbar('Comment posted');
          context.read<CommentBloc>().reset();
        } else if (state.postState.isFailure) {
          context.errorSnackbar(state.postState.errorMessage);
        }
      },
      buildWhen: (previous, current) =>
          previous.content != current.content ||
          previous.postState != current.postState,
      builder: (context, state) {
        return CustomIconButton(
          size: 36,
          icon: state.postState.isLoading
              ? const CustomProgress.small()
              : const Icon(CupertinoIcons.paperplane),
          color: context.primary,
          enabled: state.content.isNotEmpty,
          onPressed: () => context
            ..unfocus()
            ..read<CommentBloc>().postComment(),
        );
      },
    );
  }
}
