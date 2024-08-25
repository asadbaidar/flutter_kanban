import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskSyncButton extends StatelessWidget {
  const TaskSyncButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return CustomIconButton(
          tooltip: 'Sync',
          icon: const Icon(Icons.sync),
          enabled: state.taskDataState.isNotLoading,
          onPressed: () => context.read<TaskBloc>().getTasks(),
        );
      },
    );
  }
}
