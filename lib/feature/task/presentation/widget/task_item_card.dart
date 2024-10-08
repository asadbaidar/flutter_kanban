import 'package:common/common.dart';
import 'package:flutter/material.dart';

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
            : color?.withOpacity(0.1) ?? context.surfaceContainer,
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
