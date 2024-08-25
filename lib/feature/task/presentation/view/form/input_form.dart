import 'package:core/feature/task/task.dart';
import 'package:flutter/material.dart';

class TaskInputForm extends StatelessWidget {
  const TaskInputForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TaskContentInput(),
        SizedBox(height: 16),
        TaskSectionInput(),
        SizedBox(height: 16),
        TaskDescriptionInput(),
      ],
    );
  }
}
