import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:core/tab/tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:locale/locale.dart';

class TaskSubmitButton extends StatelessWidget {
  const TaskSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskFormBloc, TaskFormState>(
      listenWhen: (previous, current) =>
          previous.submitState != current.submitState,
      listener: (context, state) {
        if (state.submitState.isLoaded) {
          if (state.isEditing) {
            context.successSnackbar('Task updated');
            context.read<TaskBloc>().updateTask(state.submitState.value!);
          } else {
            context.successSnackbar('Task created');
            context.read<TaskBloc>().addTask(state.submitState.value!);
          }
          context.go(BoardPage.route());
        } else if (state.submitState.isFailure) {
          context.errorSnackbar(state.submitState.errorMessage);
        }
      },
      buildWhen: (previous, current) =>
          previous.validity != current.validity ||
          previous.submitState != current.submitState,
      builder: (context, state) {
        if (state.isEditing && state.validity.isPure) {
          return const SizedBox.shrink();
        }
        return CustomPopAction.bold(
          text: LocaleStrings.save,
          enabled: state.isValidated,
          loading: state.submitState.isLoading,
          onPressed: context.read<TaskFormBloc>().submit,
        );
      },
    );
  }
}

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

class TaskCreateButton extends StatelessWidget {
  const TaskCreateButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.go(TaskFormPage.route(context.currentRoute)),
      child: const Icon(Icons.add),
    );
  }
}
