import 'package:common/common.dart';
import 'package:core/feature/comment/comment.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskFormView extends StatelessWidget {
  const TaskFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: StretchingOverscrollIndicator(
            axisDirection: AxisDirection.down,
            child: SmartListView<void>.sliver(
              physics: const ClampingScrollPhysics(),
              sliverBuilder: (context) => [
                const SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TaskContentInput(),
                      SizedBox(height: 16),
                      _TaskActionBar(),
                      SizedBox(height: 16),
                      TaskDescriptionInput(),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
                const _CommentListView(),
              ],
            ),
          ),
        ),
        const _CommentInputForm(),
      ],
    );
  }
}

class _TaskActionBar extends StatelessWidget {
  const _TaskActionBar();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          TaskSectionInput(),
          SizedBox(width: 16),
          TaskCompleteInput(),
        ],
      ),
    );
  }
}

class _CommentListView extends StatelessWidget {
  const _CommentListView();

  @override
  Widget build(BuildContext context) {
    final isEditingPure = context.select(
      (TaskFormBloc bloc) => bloc.state.isEditingPure,
    );
    return isEditingPure ? const CommentListView() : const SliverToBoxAdapter();
  }
}

class _CommentInputForm extends StatelessWidget {
  const _CommentInputForm();

  @override
  Widget build(BuildContext context) {
    final isEditingPure = context.select(
      (TaskFormBloc bloc) => bloc.state.isEditingPure,
    );
    return isEditingPure ? const CommentFormView() : const SizedBox.shrink();
  }
}
