import 'package:common/common.dart';
import 'package:core/feature/project/project.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';

class TaskSyncButton extends StatelessWidget {
  const TaskSyncButton({super.key});

  @override
  Widget build(BuildContext context) {
    final loadingProject =
        context.select((ProjectBloc bloc) => bloc.state.dataState.isLoading);

    final loadingTask =
        context.select((TaskBloc bloc) => bloc.state.dataState.isLoading);

    final loadingCompletedTask = context
        .select((TaskCompletedBloc bloc) => bloc.state.dataState.isLoading);
    return CustomIconButton(
      tooltip: LocaleStrings.sync,
      icon: const Icon(Icons.sync),
      enabled: !loadingProject && !loadingTask && !loadingCompletedTask,
      onPressed: () {
        context.read<TaskBloc>().getTasks();
        context.read<TaskCompletedBloc>().getCompletedTasks();
      },
    );
  }
}
