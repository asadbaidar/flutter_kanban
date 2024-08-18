import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locale/locale.dart';

class CustomHorizontalListView extends StatelessWidget {
  const CustomHorizontalListView({
    super.key,
    required this.itemBuilder,
    this.itemCount = 0,
    this.section,
    this.divider,
    this.edgeDivider = const SizedBox(width: 8),
    this.height = 180,
    this.shrinkWrap = false,
    this.clipBehavior = Clip.hardEdge,
    this.controller,
  });

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final Widget? section;
  final Widget? divider;
  final Widget? edgeDivider;
  final double height;
  final bool shrinkWrap;
  final Clip clipBehavior;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (section != null) section!,
        SizedBox(
          height: height,
          child: ListView.separated(
            clipBehavior: clipBehavior,
            shrinkWrap: shrinkWrap,
            scrollDirection: Axis.horizontal,
            itemCount: itemCount,
            controller: controller,
            separatorBuilder: (context, index) =>
                divider ?? const SizedBox.shrink(),
            itemBuilder: (context, index) {
              return edgeDivider != null
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (index == 0) edgeDivider!,
                        itemBuilder(context, index),
                        if (index == itemCount - 1) edgeDivider!,
                      ],
                    )
                  : itemBuilder(context, index);
            },
          ),
        ),
      ],
    );
  }
}

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.physics = const AlwaysScrollableScrollPhysics(),
    this.headerBuilder,
    this.footerBuilder,
    required this.itemBuilder,
    this.itemCount = 0,
    this.section,
    this.divider,
    this.reverse = false,
    this.shrinkWrap = false,
    this.padding,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
  }) : children = null;

  CustomListView.fixed({
    super.key,
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.physics = const AlwaysScrollableScrollPhysics(),
    this.headerBuilder,
    this.footerBuilder,
    required List<Widget> this.children,
    this.section,
    this.divider,
    this.reverse = false,
    this.padding,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
  })  : itemBuilder = ((context, index) => children[index]),
        itemCount = children.length,
        shrinkWrap = true;

  const CustomListView.shrink({
    super.key,
    this.controller,
    this.scrollDirection = Axis.vertical,
    this.physics = const NeverScrollableScrollPhysics(),
    this.headerBuilder,
    this.footerBuilder,
    required this.itemBuilder,
    this.itemCount = 0,
    this.section,
    this.divider,
    this.reverse = false,
    this.padding = EdgeInsets.zero,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
  })  : shrinkWrap = true,
        children = null;

  final ScrollController? controller;
  final Axis scrollDirection;
  final ScrollPhysics? physics;
  final WidgetBuilder? headerBuilder;
  final WidgetBuilder? footerBuilder;
  final NullableIndexedWidgetBuilder itemBuilder;
  final List<Widget>? children;
  final int itemCount;
  final Widget? section;
  final Widget? divider;
  final bool reverse;
  final bool shrinkWrap;
  final EdgeInsetsGeometry? padding;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: controller,
      scrollDirection: scrollDirection,
      physics: physics,
      reverse: reverse,
      shrinkWrap: shrinkWrap,
      padding: padding,
      keyboardDismissBehavior: keyboardDismissBehavior,
      itemCount: itemCount + 2,
      separatorBuilder: (context, index) {
        if (index == 0) {
          return section ?? const SizedBox.shrink();
        } else if (index <= itemCount - 1) {
          return divider ?? const SizedBox.shrink();
        }
        return const SizedBox.shrink();
      },
      itemBuilder: (context, index) {
        if (index == 0) {
          return headerBuilder?.call(context) ?? const SizedBox.shrink();
        } else if (index == itemCount + 1) {
          return footerBuilder?.call(context) ?? const SizedBox.shrink();
        }

        return itemBuilder(context, index - 1);
      },
    );
  }
}

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    this.title,
    this.subtitle,
    this.bottom,
    this.padding = const EdgeInsets.only(bottom: 12),
  });

  final String? title;
  final String? subtitle;
  final Widget? bottom;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Text(
              title!,
              style: context.titleLarge,
            ),
          if (title != null && subtitle != null) const SizedBox(height: 8),
          if (subtitle != null)
            Text(
              subtitle!,
              style: context.bodyLarge,
            ),
          if (bottom != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: bottom,
            ),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.title,
    this.customTitle,
    this.subtitle,
    this.customSubtitle,
    this.leading,
    this.trailing,
    this.titleStyle,
    this.subtitleStyle,
    this.titleMaxLines,
    this.subtitleMaxLines,
    this.verticalSpacing = 0,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final String? title;
  final Widget? customTitle;
  final String? subtitle;
  final Widget? customSubtitle;
  final Widget? leading;
  final Widget? trailing;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final int? titleMaxLines;
  final int? subtitleMaxLines;
  final double verticalSpacing;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final hasTitle = title != null || customTitle != null;
    final hasSubtitle = subtitle != null || customSubtitle != null;
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        if (leading != null) ...[
          leading!,
          const SizedBox(width: 8),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (hasTitle)
                DefaultTextStyle(
                  style: titleStyle ??
                      context.bodyMedium?.onPrimaryContainer(context) ??
                      const TextStyle(),
                  maxLines: titleMaxLines,
                  overflow: titleMaxLines == 1
                      ? TextOverflow.ellipsis
                      : TextOverflow.clip,
                  child: customTitle ?? Text(title!),
                ),
              if (hasTitle && hasSubtitle) SizedBox(height: verticalSpacing),
              if (hasSubtitle)
                DefaultTextStyle(
                  style: subtitleStyle ??
                      context.bodyMedium
                          ?.onPrimaryContainer(context)
                          .focused() ??
                      const TextStyle(),
                  maxLines: subtitleMaxLines,
                  overflow: subtitleMaxLines == 1
                      ? TextOverflow.ellipsis
                      : TextOverflow.clip,
                  child: customSubtitle ?? Text(subtitle!),
                ),
            ],
          ),
        ),
        if (trailing != null) ...[
          const SizedBox(width: 8),
          trailing!,
        ],
      ],
    );
  }
}

class CustomProgress extends StatelessWidget {
  const CustomProgress({
    super.key,
    required this.size,
    this.centered = true,
    this.color,
  });

  const CustomProgress.small({
    super.key,
    this.centered = true,
    this.color,
  }) : size = 18.0;

  const CustomProgress.medium({
    super.key,
    this.centered = true,
    this.color,
  }) : size = 28.0;

  const CustomProgress.large({
    super.key,
    this.centered = true,
    this.color,
  }) : size = 34.0;

  final double size;
  final bool centered;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: centered ? null : size,
      child: Center(
        child: SizedBox.square(
          dimension: size,
          child: context.platform == TargetPlatform.iOS
              ? CupertinoActivityIndicator(
                  radius: size / 2,
                  color: color?.notDark,
                )
              : CircularProgressIndicator(
                  strokeWidth: size * 0.09,
                  color: color,
                ),
        ),
      ),
    );
  }
}

class CustomError extends StatelessWidget {
  const CustomError({
    super.key,
    this.message,
    this.emptyMessage,
    this.isFailure = false,
    this.centered = true,
    this.action,
    this.onRetry,
  });

  final String? message;
  final String? emptyMessage;
  final bool isFailure;
  final bool centered;
  final Widget? action;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: centered ? Alignment.center : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            isFailure
                ? message ?? ''
                : emptyMessage ?? LocaleStrings.emptyMessage(),
            style: context.bodyMedium
                ?.withColor(context.onSurfaceVariant.withOpacity(0.6)),
            textAlign: centered ? TextAlign.center : null,
          ),
          if (onRetry != null && isFailure)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: CustomInkWell(
                onTap: onRetry,
                borderRadius: 6,
                borderWidth: 1,
                borderColor: context.primary,
                splashColor: context.primary.withOpacity(0.2),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 6,
                ),
                child: Text(
                  LocaleStrings.retry,
                  style: context.bodyMedium?.primary(context),
                ),
              ),
            ),
          if (action != null && !isFailure)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: action,
            ),
        ],
      ),
    );
  }
}
