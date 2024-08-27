import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:core/tab/tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:locale/locale.dart';

class TaskSaveButton extends StatelessWidget {
  const TaskSaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskFormBloc, TaskFormState>(
      listenWhen: (previous, current) =>
          previous.saveState != current.saveState,
      listener: (context, state) {
        if (state.saveState.isLoaded) {
          if (state.isEditing) {
            context.successSnackbar(LocaleStrings.taskUpdated);
            context.read<TaskBloc>().updateTask(state.saveState.value!);
          } else {
            context.successSnackbar(LocaleStrings.taskCreated);
            context.read<TaskBloc>().addTask(state.saveState.value!);
          }
          context.go(BoardPage.route());
        } else if (state.saveState.isFailure) {
          context.errorSnackbar(state.saveState.errorMessage);
        }
      },
      buildWhen: (previous, current) =>
          previous.validity != current.validity ||
          previous.saveState != current.saveState,
      builder: (context, state) {
        if (state.isEditing && state.validity.isPure) {
          return const SizedBox.shrink();
        }
        return CustomPopAction.bold(
          text: LocaleStrings.save,
          enabled: state.isValidated,
          loading: state.saveState.isLoading,
          onPressed: context.read<TaskFormBloc>().save,
        );
      },
    );
  }
}
