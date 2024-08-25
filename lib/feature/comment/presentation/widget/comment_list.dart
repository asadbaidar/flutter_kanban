import 'package:common/common.dart';
import 'package:core/feature/comment/comment.dart';
import 'package:flutter/material.dart';

class CommentList extends StatelessWidget {
  const CommentList({
    super.key,
    required this.items,
  });

  final List<Comment> items;

  @override
  Widget build(BuildContext context) {
    return SmartSliverList.builder(
      headerBuilder: (_) =>
          items.isEmpty ? const SizedBox.shrink() : const CommentHeader(),
      items: items,
      itemBuilder: (context, index, item) {
        return CommentTile(item: item!);
      },
    );
  }
}
