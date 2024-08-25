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
    return Opacity(
      opacity: dragging ? 0.8 : 1,
      child: Card.filled(
        clipBehavior: Clip.antiAlias,
        color: dragging
            ? context.surfaceDim
            : section.color(context).withOpacity(0.1),
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: CustomInkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 8, 12),
            child: Row(
              children: [
                Expanded(
                  child: DynamicText(
                    title: item.content ?? '',
                    subtitle: item.description ?? '',
                  ),
                ),
                Column(
                  children: [
                    const Icon(Icons.chevron_right),
                    if (loading)
                      const Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: CustomProgress.small(),
                      ),
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
