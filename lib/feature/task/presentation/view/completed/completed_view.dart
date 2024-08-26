import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';

class TaskCompletedView extends StatelessWidget {
  const TaskCompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCompletedBloc, TaskCompletedState>(
      builder: (context, state) {
        return state.dataState.when(
          otherwise: (_) => const CustomProgress.medium(),
          failure: (data) => CustomError(
            isFailure: data.isFailure,
            message: data.errorMessage,
            onRetry: context.read<TaskCompletedBloc>().getCompletedTasks,
          ),
          loaded: (data) {
            final items = state.tasks;
            if (items.isEmpty) {
              return CustomError(
                emptyMessage: LocaleStrings.emptyMessage('completed'),
              );
            }
            return TaskCompletedList(items: items);
          },
        );
      },
    );
  }
}
