import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:core/tab/home/home.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/single_child_widget.dart';

class TaskCloseListener extends SingleChildStatelessWidget {
  const TaskCloseListener({super.key, super.child});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocListener<TaskCompletedBloc, TaskCompletedState>(
      listenWhen: (previous, current) =>
          previous.closeState != current.closeState,
      listener: (context, state) {
        if (state.closeState.isLoaded) {
          context.successSnackbar('Task closed');
          context.go(HomePage.route());
          context.read<TaskBloc>().getTasks();
          context.read<TaskCompletedBloc>().getCompletedTasks();
        } else if (state.closeState.isFailure) {
          context.errorSnackbar(state.closeState.errorMessage);
        }
      },
      child: child,
    );
  }
}
