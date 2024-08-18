import 'package:flutter/material.dart';

class CustomFixedGridView extends StatelessWidget {
  const CustomFixedGridView({
    super.key,
    this.crossAxisCount = 1,
    required this.children,
    this.horizontalSpacing = 0,
    this.verticalSpacing = 0,
  });

  final int crossAxisCount;
  final List<Widget> children;
  final double horizontalSpacing;
  final double verticalSpacing;

  @override
  Widget build(BuildContext context) {
    final count = children.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < count; i += crossAxisCount) ...[
          Row(
            children: [
              for (var j = 0; j < crossAxisCount; j++) ...[
                if (i + j < count)
                  Expanded(child: children[i + j])
                else
                  const Expanded(child: SizedBox.shrink()),
                if (horizontalSpacing > 0 && j < crossAxisCount - 1)
                  SizedBox(width: horizontalSpacing),
              ],
            ],
          ),
          if (verticalSpacing > 0 && i < count - crossAxisCount)
            SizedBox(height: verticalSpacing),
        ],
      ],
    );
  }
}
