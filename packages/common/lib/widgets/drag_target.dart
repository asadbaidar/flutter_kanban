import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CustomDragTarget<T extends Object> extends StatelessWidget {
  const CustomDragTarget({
    super.key,
    required this.items,
    required this.child,
    this.onAccept,
    required this.initialOffset,
    this.scrollOffset = 5,
    this.scrollController,
  });

  final List<T> items;
  final Widget child;
  final OnValue<T>? onAccept;
  final double initialOffset;
  final double scrollOffset;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return DragTarget<T>(
      builder: (context, candidateData, rejectedData) {
        return Stack(
          children: [
            child,
            if (candidateData.isNotEmpty &&
                !items.contains(candidateData.first))
              ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: Card.filled(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  margin: const EdgeInsets.only(top: 4),
                  color: context.tertiary.lighted,
                ),
              ),
          ],
        );
      },
      onAcceptWithDetails: (details) {
        $debugPrint('Accepted ${details.data}');
        if (!items.contains(details.data)) onAccept?.call(details.data);
      },
      onMove: scrollController == null
          ? null
          : (details) {
              // scroll the page view to the direction of the drag
              final controller = this.scrollController!;
              final dx = details.offset.dx;
              final offset = controller.offset;
              final min = controller.position.minScrollExtent;
              final max = controller.position.maxScrollExtent;

              if (dx < initialOffset && offset > min) {
                // scroll to the left
                controller.jumpTo(offset - scrollOffset);
              } else if (dx > initialOffset && offset < max) {
                // scroll to the right
                controller.jumpTo(offset + scrollOffset);
              }
            },
    );
  }
}
