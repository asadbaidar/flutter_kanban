import 'package:core/feature/task/task.dart';
import 'package:flutter/material.dart';

class TaskCompletedCard extends StatelessWidget {
  const TaskCompletedCard({
    super.key,
    required this.item,
    this.loading = false,
    this.onTap,
  });

  final TaskCompleted item;
  final bool loading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TaskItemCard(
      content: item.content,
      description: item.completedAtFormmated,
      maxLines: 3,
      completed: true,
      loading: loading,
      onTap: onTap,
    );
  }
}
