import 'package:flutter/material.dart';

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.section,
    required this.child,
  });

  final Widget section;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        section,
        const SizedBox(height: 8),
        Expanded(
          child: child,
        ),
      ],
    );
  }
}
