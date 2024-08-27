import 'package:common/common.dart';
import 'package:core/feature/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:locale/locale.dart';

class CommentTile extends StatelessWidget {
  const CommentTile({
    super.key,
    required this.item,
  });

  final Comment item;

  @override
  Widget build(BuildContext context) {
    final time =
        item.postedAt?.formatAgo(locale: context.locale.languageCode) ?? '';
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      child: CustomListTile(
        leading: const Padding(
          padding: EdgeInsets.only(top: 2),
          child: CircleAvatar(
            radius: 14,
            child: Icon(Icons.person, size: 20),
          ),
        ),
        customTitle: Row(
          children: [
             Text(LocaleStrings.me),
            const SizedBox(width: 10),
            Text(
              time,
              style: context.body3?.withColor(context.onSurface.subbed),
            ),
          ],
        ),
        titleStyle: context.title3,
        subtitle: item.content,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
}
