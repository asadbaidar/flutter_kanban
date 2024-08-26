import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TaskDiscardButton extends StatelessWidget {
  const TaskDiscardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskFormBloc, TaskFormState>(
      buildWhen: (previous, current) => previous.validity != current.validity,
      builder: (context, state) {
        return state.validity.isPure
            ? const CustomCloseAction()
            : CustomCancelAction(
                onPressed: () => ConfirmDiscardDialog.show(
                  context,
                  onDiscard: context.pop,
                ),
              );
      },
    );
  }
}
