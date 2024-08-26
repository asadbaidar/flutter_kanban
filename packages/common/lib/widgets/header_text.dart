import 'package:common/common.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText(
    this.text, {
    super.key,
    this.padding = const EdgeInsets.symmetric(vertical: 4),
  });

  final String? text;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          Text(
            text ?? '',
            style: context.title2,
          ),
        ],
      ),
    );
  }
}
