part of 'theme.dart';

class AppTextStyles {
  const AppTextStyles({required this.color});

  final Color color;

  TextStyle get base => GoogleFonts.roboto(color: color);

  /// {@template displayLarge}
  /// fontSize: 32,
  /// fontWeight: FontWeight.w600,
  /// height: 64,
  /// letterSpacing: -2.5,
  /// {@endtemplate}
  TextStyle get displayLarge => base.withGoogleFont(
        fontSize: 57,
        fontWeight: FontWeight.w600,
        height: 64,
        letterSpacing: -2.5,
      );

  /// {@template displayMedium}
  /// fontSize: 45,
  /// fontWeight: FontWeight.w500,
  /// height: 52,
  /// {@endtemplate}
  TextStyle get displayMedium => base.withGoogleFont(
        fontSize: 45,
        fontWeight: FontWeight.w500,
        height: 52,
      );

  /// {@template displaySmall}
  /// fontSize: 36,
  /// fontWeight: FontWeight.w400,
  /// height: 44,
  /// {@endtemplate}
  TextStyle get displaySmall => base.withGoogleFont(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        height: 44,
      );

  /// {@template headlineLarge}
  /// fontSize: 32,
  /// fontWeight: FontWeight.w400,
  /// height: 40,
  /// {@endtemplate}
  TextStyle get headlineLarge => base.withGoogleFont(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        height: 40,
      );

  /// {@template headlineMedium}
  /// fontSize: 28,
  /// fontWeight: FontWeight.w500,
  /// height: 36,
  /// {@endtemplate}
  TextStyle get headlineMedium => base.withGoogleFont(
        fontSize: 28,
        fontWeight: FontWeight.w500,
        height: 36,
      );

  /// {@template headlineSmall}
  /// fontSize: 24,
  /// fontWeight: FontWeight.w400,
  /// height: 32,
  /// {@endtemplate}
  TextStyle get headlineSmall => base.withGoogleFont(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        height: 32,
      );

  /// {@template titleLarge}
  /// fontSize: 22,
  /// fontWeight: FontWeight.w400,
  /// height: 28,
  /// {@endtemplate}
  TextStyle get titleLarge => base.withGoogleFont(
        fontSize: 22,
        fontWeight: FontWeight.w400,
        height: 28,
      );

  /// {@template titleMedium}
  /// fontSize: 16,
  /// fontWeight: FontWeight.w500,
  /// height: 24,
  /// letterSpacing: 0.15,
  /// {@endtemplate}
  TextStyle get titleMedium => base.withGoogleFont(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        height: 24,
        letterSpacing: 0.15,
      );

  /// {@template titleSmall}
  /// fontSize: 14,
  /// fontWeight: FontWeight.w500,
  /// height: 20,
  /// letterSpacing: 0.1,
  /// {@endtemplate}
  TextStyle get titleSmall => base.withGoogleFont(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 20,
        letterSpacing: 0.1,
      );

  /// {@template labelLarge}
  /// fontSize: 14,
  /// fontWeight: FontWeight.w500,
  /// height: 20,
  /// letterSpacing: 0.1,
  /// {@endtemplate}
  TextStyle get labelLarge => base.withGoogleFont(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 20,
        letterSpacing: 0.1,
      );

  /// {@template labelMedium}
  /// fontSize: 12,
  /// fontWeight: FontWeight.w500,
  /// height: 16,
  /// letterSpacing: 0.5,
  /// {@endtemplate}
  TextStyle get labelMedium => base.withGoogleFont(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 16,
        letterSpacing: 0.5,
      );

  /// {@template labelSmall}
  /// fontSize: 11,
  /// fontWeight: FontWeight.w500,
  /// height: 16,
  /// letterSpacing: 0.5,
  /// {@endtemplate}
  TextStyle get labelSmall => base.withGoogleFont(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: 16,
        letterSpacing: 0.5,
      );

  /// {@template bodyLarge}
  /// fontSize: 16,
  /// fontWeight: FontWeight.w400
  /// height: 24,
  /// letterSpacing: 0.5,
  /// {@endtemplate}
  TextStyle get bodyLarge => base.withGoogleFont(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24,
        letterSpacing: 0.5,
      );

  /// {@template bodyMedium}
  /// fontSize: 14,
  /// fontWeight: FontWeight.w400
  /// height: 20,
  /// letterSpacing: 0.25,
  /// {@endtemplate}
  TextStyle get bodyMedium => base.withGoogleFont(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20,
        letterSpacing: 0.25,
      );

  /// {@template bodySmall}
  /// fontSize: 12,
  /// fontWeight: FontWeight.w400
  /// height: 16,
  /// letterSpacing: 0.4,
  /// {@endtemplate}
  TextStyle get bodySmall => base.withGoogleFont(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 16,
        letterSpacing: 0.4,
      );
}

extension TextStyleWeight on TextStyle {
  /// w700
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);

  /// w600
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);

  /// w500
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);

  /// w400
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);

  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
}

extension TextStyleWithGoogleFont on TextStyle {
  TextStyle withGoogleFont({
    FontWeight? fontWeight,
    double? fontSize,
    Color? color,

    /// [height] in logical pixels as defined in Figma.
    /// It will be transformed into percentage as required by Flutter.
    double? height,

    /// [letterSpacing] in percentage as defined in Figma.
    double? letterSpacing,
    TextDecoration? decoration,
  }) {
    return GoogleFonts.getFont(
      googleFontFamily,
      textStyle: copyWith(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color,
        height: height?.divideBy(fontSize),
        letterSpacing: letterSpacing,
        decoration: decoration,
      ),
    );
  }

  String get googleFontFamily {
    if (fontFamily == null) return 'Roboto';
    final family = fontFamily!.split('_').first;
    return family
        .splitMapJoin(
          RegExp('[A-Z][a-z]*'),
          onMatch: (m) => ' ${m.group(0)}',
          onNonMatch: (n) => '',
        )
        .trim();
  }
}

extension FigmaTextStyles on AppTextStyles {
  /// {@macro displayLarge}
  TextStyle get display1 => displayLarge;

  /// {@macro displayMedium}
  TextStyle get display2 => displayMedium;

  /// {@macro displaySmall}
  TextStyle get display3 => displaySmall;

  /// {@macro headlineLarge}
  TextStyle get header1 => headlineLarge;

  /// {@macro headlineMedium}
  TextStyle get header2 => headlineMedium;

  /// {@macro headlineSmall}
  TextStyle get header3 => headlineSmall;

  /// {@macro titleLarge}
  TextStyle get title1 => titleLarge;

  /// {@macro titleMedium}
  TextStyle get title2 => titleMedium;

  /// {@macro titleSmall}
  TextStyle get title3 => titleSmall;

  /// {@macro labelLarge}
  TextStyle get label1 => labelLarge;

  /// {@macro labelMedium}
  TextStyle get label2 => labelMedium;

  /// {@macro labelSmall}
  TextStyle get label3 => labelSmall;

  /// {@macro bodyLarge}
  TextStyle get body1 => bodyLarge;

  /// {@macro bodyMedium}
  TextStyle get body2 => bodyMedium;

  /// {@macro bodySmall}
  TextStyle get body3 => bodySmall;
}

extension FigmaTextTheme on BuildContext {
  /// {@macro displayLarge}
  TextStyle? get display1 => displayLarge;

  /// {@macro displayMedium}
  TextStyle? get display2 => displayMedium;

  /// {@macro displaySmall}
  TextStyle? get display3 => displaySmall;

  /// {@macro headlineLarge}
  TextStyle? get header1 => headlineLarge;

  /// {@macro headlineMedium}
  TextStyle? get header2 => headlineMedium;

  /// {@macro headlineSmall}
  TextStyle? get header3 => headlineSmall;

  /// {@macro titleLarge}
  TextStyle? get title1 => titleLarge;

  /// {@macro titleMedium}
  TextStyle? get title2 => titleMedium;

  /// {@macro titleSmall}
  TextStyle? get title3 => titleSmall;

  /// {@macro labelLarge}
  TextStyle? get label1 => labelLarge;

  /// {@macro labelMedium}
  TextStyle? get label2 => labelMedium;

  /// {@macro labelSmall}
  TextStyle? get label3 => labelSmall;

  /// {@macro bodyLarge}
  TextStyle? get body1 => bodyLarge;

  /// {@macro bodyMedium}
  TextStyle? get body2 => bodyMedium;

  /// {@macro bodySmall}
  TextStyle? get body3 => bodySmall;

  /// fontSize: 22,
  /// fontWeight: FontWeight.w800,
  TextStyle get logo => GoogleFonts.mulish(
        color: onSurface,
        fontSize: 22,
        fontWeight: FontWeight.w800,
      );
}

extension FigmaTextWeght on TextStyle {
  /// bold
  TextStyle get w700 => bold;

  /// semiBold
  TextStyle get w600 => semiBold;

  /// medium
  TextStyle get w500 => medium;

  /// regular
  TextStyle get w400 => regular;
}
