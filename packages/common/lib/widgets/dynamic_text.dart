import 'package:common/common.dart';
import 'package:flutter/material.dart';

class DynamicText extends StatelessWidget {
  const DynamicText({
    super.key,
    required this.title,
    required this.subtitle,
    this.style,
    this.maxLines = 4,
    this.subtitleRequired = false,
  });

  final String title;
  final String subtitle;
  final TextStyle? style;
  final int maxLines;
  final bool subtitleRequired;

  @override
  Widget build(BuildContext context) {
    final style = this.style ?? context.body2;
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final titleLines = title.isBlank
            ? 0
            : context.getTextLines(
                title,
                style: style,
                maxWidth: width,
              );

        final subtitleLines = subtitleRequired && subtitle.isNotBlank ? 1 : 0;

        final headLines =
            titleLines >= maxLines ? maxLines - subtitleLines : titleLines;
        final subLines =
            titleLines >= maxLines ? subtitleLines : maxLines - titleLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (headLines > 0)
              Text(
                title,
                style: style,
                maxLines: headLines,
                overflow: TextOverflow.ellipsis,
              ),
            if (subLines > 0)
              Text(
                subtitle,
                style: style?.focused(),
                maxLines: subLines,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        );
      },
    );
  }
}
