import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskContentInput extends StatelessWidget {
  const TaskContentInput({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskFormBloc, TaskFormState>(
      buildWhen: (previous, current) => previous.content != current.content,
      builder: (context, state) {
        return CustomTextField(
          initialValue: state.content.value,
          onChanged: context.read<TaskFormBloc>().contentChanged,
          hintText: 'Summary',
          textStyle: context.title1,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
