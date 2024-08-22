import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/material.dart';

class SectionCard extends StatelessWidget {
  const SectionCard(
    this.section, {
    super.key,
    this.count = 0,
  });

  final Section section;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      margin: EdgeInsets.zero,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        title: Text(section.name ?? ''),
        titleTextStyle: context.title2?.w700,
        trailing: count > 0
            ? ColoredTagView(
                text: count.toString(),
                foreground: section.color(context),
              )
            : null,
      ),
    );
  }
}

extension SectionColor on Section {
  Color color(BuildContext context) {
    switch (order) {
      case 2:
        return const Color(0xffe5680f);
      case 3:
        return const Color(0xff0F9D58);
      default:
        return context.primary;
    }
  }
}
