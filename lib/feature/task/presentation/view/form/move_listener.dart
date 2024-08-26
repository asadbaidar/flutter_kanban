import 'package:core/feature/task/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

class TaskMoveListener extends SingleChildStatelessWidget {
  const TaskMoveListener({super.key, super.child});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocListener<TaskFormBloc, TaskFormState>(
      listenWhen: (previous, current) =>
          previous.sectionId != current.sectionId,
      listener: (context, state) {
        final task = context.read<TaskFormBloc>().state.task;
        if (task != null) {
          context.read<TaskBloc>().moveTask(
                task,
                toSection: state.sectionId.value,
              );
        }
      },
      child: child,
    );
  }
}
