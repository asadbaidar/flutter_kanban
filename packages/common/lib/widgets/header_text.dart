import 'package:common/common.dart';
import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  const HeaderText(
    this.text, {
    super.key,
    this.trailing,
    this.padding = const EdgeInsets.symmetric(vertical: 6),
  });

  final String? text;
  final Widget? trailing;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text ?? '',
            style: context.title2,
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
