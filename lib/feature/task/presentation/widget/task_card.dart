import 'package:common/common.dart';
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

class TaskCompletedCard extends StatelessWidget {
  const TaskCompletedCard({
    super.key,
    required this.item,
    this.section,
    this.loading = false,
    this.onTap,
  });

  final CompletedTask item;
  final Section? section;
  final bool loading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return TaskItemCard(
      content: item.content,
      description: item.completedAtFormmated,
      maxLines: 3,
      completed: true,
      color: section?.color(context),
      loading: loading,
      onTap: onTap,
    );
  }
}

class TaskItemCard extends StatelessWidget {
  const TaskItemCard({
    super.key,
    this.content,
    this.description,
    this.color,
    this.maxLines = 4,
    this.completed = false,
    this.loading = false,
    this.dragging = false,
    this.onTap,
  });

  final String? content;
  final String? description;
  final Color? color;
  final int maxLines;
  final bool completed;
  final bool loading;
  final bool dragging;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: dragging ? 0.8 : 1,
      child: Card.filled(
        clipBehavior: Clip.antiAlias,
        color: dragging
            ? context.surfaceDim
            : (color ?? context.primary).withOpacity(0.1),
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: CustomInkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 8, 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: DynamicText(
                    title: content ?? '',
                    subtitle: description ?? '',
                    maxLines: maxLines,
                    subtitleRequired: completed,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (completed)
                      const Icon(Icons.expand_more)
                    else
                      const Icon(Icons.chevron_right),
                    if (loading)
                      const Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: CustomProgress.small(),
                      )
                    else
                      const SizedBox.square(dimension: 22),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
