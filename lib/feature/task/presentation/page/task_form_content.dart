import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/material.dart';

class TaskFormContent extends StatelessWidget {
  const TaskFormContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomBottomSheet(
      dragHandle: CustomDragHandle(padding: EdgeInsets.only(top: 16)),
      leadingAction: TaskDiscardButton(),
      trailingAction: TaskSubmitButton(),
      customTitle: SizedBox(height: 16),
      body: TaskInputForm(),
    );
  }
}
