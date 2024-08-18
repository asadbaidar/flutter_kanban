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
    this.content,
    this.stretch = true,
    this.loading = false,
    this.canDone = true,
    this.canApply = true,
    this.onDone,
    this.onApply,
    this.crossAxisAlignment,
  });

  final bool showDragHandle;
  final Widget dragHandle;
  final String? title;
  final Widget? customTitle;
  final Widget? header;
  final Widget? content;
  final bool stretch;
  final bool loading;
  final bool canDone;
  final bool canApply;
  final VoidCallback? onDone;
  final VoidCallback? onApply;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
      mainAxisSize: stretch ? MainAxisSize.max : MainAxisSize.min,
      children: [
        if (showDragHandle) dragHandle,
        if (onDone != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomCancelAction(),
                CustomDoneAction(
                  enabled: canDone,
                  onPressed: onDone,
                ),
              ],
            ),
          ),
        if (title != null)
          CustomHeader(
            title: title,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          ),
        if (customTitle != null) customTitle!,
        if (loading)
          const Padding(
            padding: EdgeInsets.only(top: 100),
            child: CustomProgress.large(),
          )
        else ...[
          if (header != null) header!,
          if (content != null) stretch ? Expanded(child: content!) : content!,
          if (onApply != null) ...[
            const Divider(),
            SafeArea(
              top: false,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomCancelButton(
                      padding: EdgeInsets.zero,
                      width: 130,
                    ),
                    const SizedBox(width: 8),
                    CustomApplyButton(
                      enabled: canApply,
                      onPressed: onApply,
                      padding: EdgeInsets.zero,
                      width: 130,
                    ),
                  ],
                ),
              ),
            ),
          ],
          if (!stretch) const SizedBox(height: 16),
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
  });

  final Color? color;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    final BottomSheetThemeData bottomSheetTheme =
        Theme.of(context).bottomSheetTheme;
    final Size handleSize =
        size ?? bottomSheetTheme.dragHandleSize ?? const Size(44, 5);

    final handleColor = color ??
        bottomSheetTheme.dragHandleColor ??
        Theme.of(context).colorScheme.outline;

    return Container(
      padding: const EdgeInsets.only(top: 16, bottom: 24),
      width: double.infinity,
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
