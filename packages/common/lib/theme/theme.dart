import 'package:common/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

part 'colors.dart';
part 'text_styles.dart';

const kDefaultToolbarHeight = 64.0;

class AppTheme {
  AppTheme({
    required this.colors,
    AppTextStyles? textStyles,
  }) : textStyles = textStyles ??
            AppTextStyles(
              color: colors.colorScheme.onSurface,
            );

  factory AppTheme.light() => AppTheme(colors: const AppColors.light());

  factory AppTheme.dark() => AppTheme(colors: const AppColors.dark());

  final AppColors colors;
  final AppTextStyles textStyles;

  ThemeData data(BuildContext context) => _builder(
        mediaQuery: context.mediaQuery,
        colors: colors,
        textStyles: textStyles,
      );

  ThemeData _builder({
    required MediaQueryData mediaQuery,
    required AppColors colors,
    required AppTextStyles textStyles,
  }) {
    final colorScheme = colors.colorScheme;
    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.surface,
      canvasColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        scrolledUnderElevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: colorScheme.brightness,
          statusBarIconBrightness: colorScheme.brightness.inverse,
          systemNavigationBarColor: colorScheme.surface,
          systemNavigationBarIconBrightness: colorScheme.brightness,
        ),
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: colorScheme.brightness,
        scaffoldBackgroundColor: colorScheme.surface,
        textTheme: CupertinoTextThemeData(
          primaryColor: colorScheme.primary,
          textStyle: textStyles.body1,
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        clipBehavior: Clip.antiAlias,
        constraints: BoxConstraints(
          maxHeight: mediaQuery.size.height -
              (mediaQuery.padding.top + kDefaultToolbarHeight),
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        insetPadding: EdgeInsets.fromLTRB(16, 16, 16, 32),
      ),
      textTheme: TextTheme(
        displayLarge: textStyles.displayLarge,
        displayMedium: textStyles.displayMedium,
        displaySmall: textStyles.displaySmall,
        headlineLarge: textStyles.headlineLarge,
        headlineMedium: textStyles.headlineMedium,
        headlineSmall: textStyles.headlineSmall,
        titleLarge: textStyles.titleLarge,
        titleMedium: textStyles.titleMedium,
        titleSmall: textStyles.titleSmall,
        labelLarge: textStyles.labelLarge,
        labelMedium: textStyles.labelMedium,
        labelSmall: textStyles.labelSmall,
        bodyLarge: textStyles.bodyLarge,
        bodyMedium: textStyles.bodyMedium,
        bodySmall: textStyles.bodySmall,
      ),
      fontFamily: textStyles.base.googleFontFamily,
    );
  }
}

extension AppThemeContext on BuildContext {
  IconThemeData get localIconTheme => IconTheme.of(this);

  SystemUiOverlayStyle? get systemOverlayStyle =>
      appBarTheme.systemOverlayStyle;

  SystemUiOverlayStyle? get lightStatusBar => systemOverlayStyle?.copyWith(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      );

  SystemUiOverlayStyle? get darkStatusBar => systemOverlayStyle?.copyWith(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      );

  SystemUiOverlayStyle? get surfaceContainerNavBar =>
      systemOverlayStyle?.copyWith(
        systemNavigationBarColor: surfaceContainer,
      );

  ThemeData get surfaceContainerNavBarTheme => theme.copyWith(
        appBarTheme: appBarTheme.copyWith(
          systemOverlayStyle: surfaceContainerNavBar,
        ),
      );
}
