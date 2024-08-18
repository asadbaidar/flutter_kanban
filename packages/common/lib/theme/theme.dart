import 'package:common/common.dart';
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
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: colorScheme.brightness,
          statusBarIconBrightness: colorScheme.brightness.inverse,
          systemNavigationBarColor: colorScheme.surface,
          systemNavigationBarIconBrightness: colorScheme.brightness,
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

  SystemUiOverlayStyle? get transparentBars => systemOverlayStyle?.copyWith(
        statusBarBrightness: theme.brightness.inverse,
        statusBarIconBrightness: theme.brightness,
        systemNavigationBarColor: scrim,
        systemNavigationBarIconBrightness: theme.brightness,
      );

  SystemUiOverlayStyle? get lightStatusBar => systemOverlayStyle?.copyWith(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      );

  SystemUiOverlayStyle? get darkStatusBar => systemOverlayStyle?.copyWith(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      );

  ThemeData get transparentBarsTheme => theme.copyWith(
        appBarTheme: appBarTheme.copyWith(
          systemOverlayStyle: transparentBars,
        ),
      );

  SystemUiOverlayStyle? get bottomNavigationBar => systemOverlayStyle?.copyWith(
        systemNavigationBarColor: primaryContainer,
      );

  ThemeData get bottomNavigationBarTheme => theme.copyWith(
        appBarTheme: appBarTheme.copyWith(
          systemOverlayStyle: bottomNavigationBar,
        ),
      );
}
