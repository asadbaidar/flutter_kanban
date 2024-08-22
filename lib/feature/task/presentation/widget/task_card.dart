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
  });

  final Task item;
  final Section section;
  final bool loading;
  final bool dragging;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: dragging ? 0.8 : 1,
      child: Card.filled(
        color: dragging
            ? context.surfaceDim
            : section.color(context).withOpacity(0.1),
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 8, 12),
          child: CustomListTile(
            title: item.content,
            trailing: Column(
              children: [
                const Icon(Icons.chevron_right),
                if (loading)
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: CustomProgress.small(),
                  ),
              ],
            ),
            titleMaxLines: 2,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}
