import 'package:common/common.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    this.showDragHandle = true,
    this.dragHandle = const CustomDragHandle(),
    this.title,
    this.customTitle,
    this.header,
    this.body,
    this.stretch = true,
    this.loading = false,
    this.leadingAction,
    this.trailingAction,
    this.crossAxisAlignment,
  });

  final bool showDragHandle;
  final Widget dragHandle;
  final String? title;
  final Widget? customTitle;
  final Widget? header;
  final Widget? body;
  final bool stretch;
  final bool loading;
  final Widget? leadingAction;
  final Widget? trailingAction;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      mainAxisSize: stretch ? MainAxisSize.max : MainAxisSize.min,
      children: [
        if (showDragHandle) dragHandle,
        if (trailingAction != null || leadingAction != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                leadingAction ?? const CustomCancelAction(),
                if (trailingAction != null) trailingAction!,
              ],
            ),
          ),
        if (title != null)
          CustomTitleBar(
            title: title,
            padding: EdgeInsets.fromLTRB(16, showDragHandle ? 0 : 32, 16, 16),
          ),
        if (customTitle != null) customTitle!,
        if (loading)
          const Padding(
            padding: EdgeInsets.only(top: 100),
            child: CustomProgress.large(),
          )
        else ...[
          if (header != null) header!,
          if (body != null) stretch ? Expanded(child: body!) : body!,
        ],
      ],
    );
  }
}

class CustomDragHandle extends StatelessWidget {
  const CustomDragHandle({
    super.key,
    this.color,
    this.size,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
  });

  final Color? color;
  final Size? size;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final BottomSheetThemeData bottomSheetTheme =
        Theme.of(context).bottomSheetTheme;
    final Size handleSize =
        size ?? bottomSheetTheme.dragHandleSize ?? const Size(44, 5);

    final handleColor = color ??
        bottomSheetTheme.dragHandleColor ??
        Theme.of(context).colorScheme.outline;

    return Padding(
      padding: padding,
      child: Center(
        child: Container(
          height: handleSize.height,
          width: handleSize.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(handleSize.height / 2),
            color: handleColor,
          ),
        ),
      ),
    );
  }
}
