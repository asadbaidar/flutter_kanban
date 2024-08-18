import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.leading,
    this.trailing,
    this.textStyle,
    this.height,
    this.width,
    this.elevation = 0,
    this.enabled = true,
    this.loading = false,
    this.padding,
    this.margin,
    this.borderRadius = 12.0,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
  });

  const CustomElevatedButton.expanded({
    super.key,
    required this.text,
    this.leading,
    this.trailing,
    this.textStyle,
    this.height,
    this.elevation = 0,
    this.enabled = true,
    this.loading = false,
    this.padding,
    this.margin,
    this.borderRadius = 12.0,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
  }) : width = double.infinity;

  final String text;
  final Widget? leading;
  final Widget? trailing;
  final TextStyle? textStyle;
  final double? height;
  final double? width;
  final double? elevation;
  final bool enabled;
  final bool loading;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      constraints: BoxConstraints(
        minHeight: height ?? 0,
        minWidth: width ?? 0,
      ),
      child: ElevatedButton(
        onPressed: loading
            ? () {}
            : enabled
                ? onPressed
                : null,
        style: ElevatedButton.styleFrom(
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          backgroundColor: backgroundColor ?? context.primary,
          foregroundColor: foregroundColor ?? context.onPrimary,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          textStyle: textStyle ?? context.label1,
          disabledBackgroundColor: context.tertiaryContainer,
          disabledForegroundColor: context.onPrimary,
          elevation: elevation,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (leading != null) ...[
              leading!,
              const SizedBox(width: 8.0),
            ],
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: loading
                    ? CustomProgress(color: context.onPrimary, size: 20)
                    : Text(text),
              ),
            ),
            if (trailing != null) ...[
              const SizedBox(width: 8.0),
              trailing!,
            ],
          ],
        ),
      ),
    );
  }
}
