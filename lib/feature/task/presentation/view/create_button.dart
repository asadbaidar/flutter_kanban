import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
