import 'package:common/common.dart';
import 'package:core/feature/comment/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentInputForm extends StatelessWidget {
  const CommentInputForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Divider(),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: _CommentContentInput(),
                ),
                _CommentSaveButton(),
                SizedBox(width: 8),
              ],
            ),
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _CommentContentInput extends StatelessWidget {
  const _CommentContentInput();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentBloc, CommentState>(
      buildWhen: (previous, current) =>
          previous.content != current.content ||
          previous.submitState != current.submitState,
      builder: (context, state) {
        return CustomTextField(
          key: ValueKey(state.submitState),
          initialValue: state.content.value,
          onChanged: context.read<CommentBloc>().contentChanged,
          hintText: 'Add a comment',
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          minLines: 1,
          maxLines: 4,
          padding: EdgeInsets.zero,
          margin: const EdgeInsets.symmetric(vertical: 8),
        );
      },
    );
  }
}

class _CommentSaveButton extends StatelessWidget {
  const _CommentSaveButton();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommentBloc, CommentState>(
      listenWhen: (previous, current) =>
          previous.submitState != current.submitState,
      listener: (context, state) {
        if (state.submitState.isLoaded) {
          context.successSnackbar('Comment posted');
          context.read<CommentBloc>().reset();
        } else if (state.submitState.isFailure) {
          context.errorSnackbar(state.submitState.errorMessage);
        }
      },
      buildWhen: (previous, current) =>
          previous.content != current.content ||
          previous.submitState != current.submitState,
      builder: (context, state) {
        return CustomIconButton(
          size: 36,
          icon: state.submitState.isLoading
              ? const CustomProgress.small()
              : const Icon(CupertinoIcons.paperplane),
          color: context.primary,
          enabled: state.content.isNotEmpty,
          onPressed: () => context
            ..unfocus()
            ..read<CommentBloc>().createComment(),
        );
      },
    );
  }
}
