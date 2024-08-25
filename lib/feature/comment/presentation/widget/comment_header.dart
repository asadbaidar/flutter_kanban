import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CommentHeader extends StatelessWidget {
  const CommentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          thickness: 4,
          color: context.surfaceContainerHighest,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          child: Text(
            'Comments',
            style: context.title2,
          ),
        ),
      ],
    );
  }
}
