import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';

class TaskDescriptionInput extends StatelessWidget {
  const TaskDescriptionInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskFormBloc, TaskFormState>(
      buildWhen: (previous, current) =>
          previous.description != current.description,
      builder: (context, state) {
        return CustomTextField(
          initialValue: state.description.value,
          onChanged: context.read<TaskFormBloc>().descriptionChanged,
          hintText: LocaleStrings.description,
          textStyle: context.body2,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
        );
      },
    );
  }
}
