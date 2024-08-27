import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInkWell extends StatelessWidget {
  const CustomInkWell({
    super.key,
    this.child,
    this.color,
    this.image,
    this.splashColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius = 0,
    this.outlineColor,
    this.outlineWidth,
    this.elevation,
    this.dropShadow,
    this.size,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.padding,
    this.pressedOpacity,
    this.enabled = true,
    this.onTap,
    this.borderRadiusDetails,
    this.dropShadows,
  });

  const CustomInkWell.rounded({
    super.key,
    this.child,
    this.color,
    this.image,
    this.splashColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius = 10,
    this.outlineColor,
    this.outlineWidth,
    this.elevation,
    this.dropShadow,
    this.size,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.padding,
    this.pressedOpacity,
    this.enabled = true,
    this.onTap,
    this.borderRadiusDetails,
    this.dropShadows,
  });

  final Widget? child;
  final Color? color;
  final ImageProvider? image;
  final Color? splashColor;
  final Color? borderColor;
  final double? borderWidth;
  final double borderRadius;
  final Color? outlineColor;
  final double? outlineWidth;
  final double? elevation;
  final double? dropShadow;
  final double? size;
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusDirectional? borderRadiusDetails;
  final List<BoxShadow>? dropShadows;

  /// `0.4` is recommended for buttons and `0.6` for cards/images
  final double? pressedOpacity;
  final bool enabled;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: constraints,
      margin: margin,
      child: Material(
        type: color == null && outlineWidth == null
            ? MaterialType.transparency
            : MaterialType.canvas,
        color: outlineWidth != null ? outlineColor ?? context.outline : null,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadiusDetails ??
              BorderRadiusDirectional.all(
                Radius.circular(borderRadius + (outlineWidth ?? 0)),
              ),
        ),
        child: Container(
          margin: EdgeInsets.all(outlineWidth ?? 0),
          decoration: dropShadow != null || dropShadows != null
              ? ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: borderRadiusDetails ??
                        BorderRadiusDirectional.all(
                          Radius.circular(borderRadius),
                        ),
                  ),
                  shadows: dropShadows ??
                      [
                        BoxShadow(
                          color: context.outline,
                          blurRadius: dropShadow!,
                          offset: const Offset(0, 2),
                        ),
                      ],
                )
              : null,
          child: Material(
            type:
                color == null ? MaterialType.transparency : MaterialType.canvas,
            color: color ?? Colors.transparent,
            clipBehavior: Clip.antiAlias,
            elevation: elevation ?? 0,
            shadowColor: context.shadow.withOpacity(0.4),
            shape: RoundedRectangleBorder(
              side: borderWidth != null
                  ? BorderSide(
                      color: borderColor ?? context.outline,
                      width: borderWidth!,
                    )
                  : BorderSide.none,
              borderRadius: borderRadiusDetails ??
                  BorderRadiusDirectional.all(Radius.circular(borderRadius)),
            ),
            child: onTap == null || !enabled
                ? _child
                : pressedOpacity != null
                    ? CupertinoButton(
                        onPressed: onTap,
                        pressedOpacity: pressedOpacity,
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        child: _child,
                      )
                    : InkWell(
                        onTap: onTap,
                        splashColor: splashColor,
                        highlightColor: splashColor?.withOpacity(0.1),
                        child: _child,
                      ),
          ),
        ),
      ),
    );
  }

  Widget get _child => SizedBox(
        width: size ?? width,
        height: size ?? height,
        child: _image ??
            Container(
              padding: padding,
              child: child,
            ),
      );

  Widget? get _image => image != null
      ? Ink(
          padding: padding,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image!,
              fit: BoxFit.cover,
            ),
          ),
          child: child,
        )
      : null;
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    this.tooltip,
    this.color,
    this.backgroundColor,
    this.backgroundImage,
    this.borderColor,
    this.outlineColor,
    this.size = 40,
    this.iconSize,
    this.dropShadow,
    this.elevation,
    this.borderWidth,
    this.borderRadius,
    this.outlineWidth,
    this.circle = false,
    this.enabled = true,
    this.padding,
    this.onPressed,
    this.dropShadows,
  })  : pressedOpacity = null,
        floating = false;

  const CustomIconButton.cupertino({
    super.key,
    required this.icon,
    this.tooltip,
    this.color,
    this.backgroundColor,
    this.backgroundImage,
    this.borderColor,
    this.outlineColor,
    this.size = 40,
    this.iconSize,
    this.pressedOpacity = 0.4,
    this.dropShadow,
    this.elevation,
    this.borderWidth,
    this.borderRadius,
    this.outlineWidth,
    this.circle = false,
    this.enabled = true,
    this.padding,
    this.onPressed,
    this.dropShadows,
  }) : floating = false;

  const CustomIconButton.floating({
    super.key,
    required this.icon,
    this.tooltip,
    this.color,
    this.backgroundColor,
    this.backgroundImage,
    this.borderColor,
    this.outlineColor,
    this.size = 40,
    this.iconSize,
    this.dropShadow = 8,
    this.elevation,
    this.borderWidth,
    this.borderRadius,
    this.outlineWidth,
    this.circle = true,
    this.enabled = true,
    this.padding,
    this.onPressed,
    this.dropShadows,
  })  : pressedOpacity = null,
        floating = true;

  const CustomIconButton.circle({
    super.key,
    required this.icon,
    this.tooltip,
    this.color,
    this.backgroundColor,
    this.backgroundImage,
    this.borderColor,
    this.outlineColor,
    this.size = 40,
    this.iconSize,
    this.dropShadow,
    this.elevation,
    this.borderWidth,
    this.borderRadius,
    this.outlineWidth,
    this.enabled = true,
    this.padding,
    this.onPressed,
    this.dropShadows,
  })  : pressedOpacity = null,
        floating = false,
        circle = true;

  final Widget icon;
  final String? tooltip;
  final Color? color;
  final Color? backgroundColor;
  final ImageProvider? backgroundImage;
  final Color? borderColor;
  final Color? outlineColor;
  final double size;
  final double? iconSize;
  final double? pressedOpacity;
  final double? dropShadow;
  final double? elevation;
  final double? borderWidth;
  final double? borderRadius;
  final double? outlineWidth;
  final bool floating;
  final bool circle;
  final bool enabled;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final List<BoxShadow>? dropShadows;

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    return CustomInkWell(
      onTap: enabled ? onPressed : null,
      color: backgroundColor ?? (floating ? context.surface : null),
      image: backgroundImage,
      dropShadow: dropShadow,
      dropShadows: dropShadows,
      elevation: elevation,
      borderColor: borderColor,
      borderWidth: borderWidth,
      outlineColor: outlineColor,
      outlineWidth: outlineWidth,
      pressedOpacity: pressedOpacity,
      padding: padding ?? EdgeInsets.zero,
      size: size,
      borderRadius: borderRadius ?? (circle ? size : 10),
      child: Center(
        child: IconTheme(
          data: iconTheme.copyWith(
            size: iconSize,
            color: enabled ? color : (color ?? iconTheme.color)?.disabled,
          ),
          child: icon,
        ),
      ),
    ).tooltip(tooltip);
  }
}

extension TooltipWidget on Widget {
  Widget tooltip(
    String? message, {
    bool enabled = true,
    Key? key,
  }) =>
      enabled && message?.notBlank != null
          ? Tooltip(
              key: key,
              message: message,
              child: this,
            )
          : this;
}

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    super.key,
    this.text,
    this.textStyle,
    this.icon,
    this.color,
    this.pressedOpacity = 0.4,
    this.padding,
    this.bold = false,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
  });

  const CustomActionButton.bold({
    super.key,
    this.text,
    this.textStyle,
    this.icon,
    this.color,
    this.pressedOpacity = 0.4,
    this.padding,
    this.loading = false,
    this.enabled = true,
    this.onPressed,
  }) : bold = true;

  final String? text;
  final TextStyle? textStyle;
  final Widget? icon;
  final Color? color;
  final double? pressedOpacity;
  final EdgeInsetsGeometry? padding;
  final bool bold;
  final bool loading;
  final bool enabled;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final color = this.color ?? context.secondary;
    final foreground = enabled ? color : color.disabled;
    if (loading) return CustomProgress.small(color: color);

    return CustomInkWell(
      onTap: onPressed,
      pressedOpacity: pressedOpacity,
      padding: padding,
      borderRadius: pressedOpacity != null ? 0 : 8,
      enabled: enabled,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: IconTheme(
                data: context.iconTheme.copyWith(color: foreground),
                child: icon!,
              ),
            ),
          Text(
            text ?? '',
            style: (textStyle ?? context.body1)?.withGoogleFont(
              color: foreground,
              fontWeight: bold ? FontWeight.bold : null,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTagView extends StatelessWidget {
  const CustomTagView({
    super.key,
    this.text,
    this.trailing,
    this.foreground,
    this.background,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
    this.margin,
    this.enabled = true,
    this.loading = false,
    this.onTap,
  });

  const CustomTagView.dropDown({
    super.key,
    this.text,
    this.trailing = const Icon(Icons.expand_more),
    this.foreground,
    this.background,
    this.padding = const EdgeInsetsDirectional.fromSTEB(11, 4, 7, 4),
    this.margin,
    this.enabled = true,
    this.loading = false,
    this.onTap,
  });

  final String? text;
  final Widget? trailing;
  final Color? foreground;
  final Color? background;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;
  final bool enabled;
  final bool loading;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = foreground ?? context.primary;
    return CustomInkWell(
      color: background ?? color.withOpacity(0.1),
      borderRadius: 4,
      padding: padding,
      margin: margin,
      enabled: enabled,
      onTap: onTap,
      child: DefaultTextStyle(
        style: (context.labelLarge ?? const TextStyle()).withColor(color),
        child: IconTheme(
          data: IconTheme.of(context).copyWith(color: color, size: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(text ?? ''),
              if (trailing != null) ...[
                const SizedBox(width: 6),
                if (loading)
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    child: CustomProgress(size: 14),
                  )
                else
                  trailing!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
