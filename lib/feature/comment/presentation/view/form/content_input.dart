import 'package:common/common.dart';
import 'package:core/feature/comment/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentContentInput extends StatelessWidget {
  const CommentContentInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentBloc, CommentState>(
      buildWhen: (previous, current) =>
          previous.content != current.content ||
          previous.postState != current.postState,
      builder: (context, state) {
        return CustomTextField(
          key: ValueKey(state.postState),
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
