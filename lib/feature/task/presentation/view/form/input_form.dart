import 'package:common/common.dart';
import 'package:core/feature/comment/comment.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskInputForm extends StatelessWidget {
  const TaskInputForm({super.key});

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
                      TaskSectionInput(),
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

class _CommentListView extends StatelessWidget {
  const _CommentListView();

  @override
  Widget build(BuildContext context) {
    final isEditing = context.select(
      (TaskFormBloc bloc) => bloc.state.validity.isPure && bloc.state.isEditing,
    );
    return isEditing ? const CommentListView() : const SliverToBoxAdapter();
  }
}

class _CommentInputForm extends StatelessWidget {
  const _CommentInputForm();

  @override
  Widget build(BuildContext context) {
    final isEditing = context.select(
      (TaskFormBloc bloc) => bloc.state.validity.isPure && bloc.state.isEditing,
    );
    return isEditing ? const CommentInputForm() : const SizedBox.shrink();
  }
}
