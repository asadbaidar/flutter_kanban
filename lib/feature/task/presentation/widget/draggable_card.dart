import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/material.dart';

class TaskDraggableCard extends StatelessWidget {
  const TaskDraggableCard({
    super.key,
    required this.section,
    required this.item,
    required this.size,
    this.loading = false,
    this.dragging = false,
    this.dragKey,
    this.onDragStart,
    this.onDragEnd,
    this.onTap,
  });

  final Section section;
  final Task item;
  final Size size;
  final bool loading;
  final bool dragging;
  final Key? dragKey;
  final OnValue<Task>? onDragStart;
  final VoidCallback? onDragEnd;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final empty = SizedBox.fromSize(size: size);
    return LongPressDraggable<Task>(
      data: item,
      maxSimultaneousDrags: loading ? 0 : 1,
      onDragStarted: () => onDragStart?.call(item),
      onDragEnd: (_) => onDragEnd?.call(),
      onDragCompleted: onDragEnd,
      onDraggableCanceled: (_, __) => onDragEnd?.call(),
      feedback: SizedBox.fromSize(
        size: size,
        child: TaskCard(
          item: item,
          section: section,
          key: dragKey,
          dragging: true,
        ),
      ),
      childWhenDragging: empty,
      child: dragging
          ? empty
          : SizedBox(
              height: size.height,
              child: TaskCard(
                item: item,
                section: section,
                loading: loading,
                onTap: onTap,
              ),
            ),
    );
  }
}
