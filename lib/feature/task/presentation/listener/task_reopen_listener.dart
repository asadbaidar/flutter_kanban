import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:core/tab/board/board.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:locale/locale.dart';
import 'package:provider/single_child_widget.dart';

class TaskReopenListener extends SingleChildStatelessWidget {
  const TaskReopenListener({super.key, super.child});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocListener<TaskCompletedBloc, TaskCompletedState>(
      listenWhen: (previous, current) =>
          previous.reopenState != current.reopenState,
      listener: (context, state) {
        if (state.reopenState.isLoaded) {
          context.successSnackbar(LocaleStrings.taskReopened);
          context.go(BoardPage.route());
          context.read<TaskBloc>().getTasks();
          context.read<TaskCompletedBloc>().getCompletedTasks();
        } else if (state.reopenState.isFailure) {
          context.errorSnackbar(state.reopenState.errorMessage);
        }
      },
      child: child,
    );
  }
}
