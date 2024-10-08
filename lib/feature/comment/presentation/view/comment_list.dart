import 'package:common/common.dart';
import 'package:core/feature/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentListView extends StatelessWidget {
  const CommentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentBloc, CommentState>(
      buildWhen: (previous, current) => previous.dataState != current.dataState,
      builder: (context, state) {
        return state.dataState.when(
          orElse: (_) => const CustomProgress.small().paddingAll(16).sliverBox,
          failure: (data) => CustomError(
            isFailure: data.isFailure,
            message: data.errorMessage,
            onRetry: () => context.read<CommentBloc>().getComments(),
          ).sliverBox,
          loaded: (data) {
            final comments = state.comments;
            return _CommentList(items: comments);
          },
        );
      },
    );
  }
}

class _CommentList extends StatelessWidget {
  const _CommentList({
    required this.items,
  });

  final List<Comment> items;

  @override
  Widget build(BuildContext context) {
    return SmartSliverList.builder(
      headerBuilder: (_) =>
          items.isEmpty ? const SizedBox.shrink() : const CommentHeader(),
      items: items,
      itemBuilder: (context, index, item) {
        return CommentTile(item: item!);
      },
    );
  }
}
