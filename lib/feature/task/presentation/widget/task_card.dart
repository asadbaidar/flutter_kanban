import 'package:core/feature/task/task.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.item,
    required this.section,
    this.loading = false,
    this.dragging = false,
    this.onTap,
  });

  final Task item;
  final Section section;
  final bool loading;
  final bool dragging;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TaskItemCard(
      content: item.content,
      description: item.description,
      color: section.color(context),
      loading: loading,
      dragging: dragging,
      onTap: onTap,
    );
  }
}
