import 'package:core/feature/comment/comment.dart';
import 'package:flutter/material.dart';

class CommentFormView extends StatelessWidget {
  const CommentFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      top: false,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Divider(),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: CommentContentInput(),
                ),
                CommentPostButton(),
                SizedBox(width: 8),
              ],
            ),
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
