part of 'theme.dart';

const _kLightColor = Color(0xFFFFFFFF);
const _kDarkColor = Color(0xFF000000);

class AppColors {
  const AppColors({required this.colorScheme});

  const AppColors.light() : colorScheme = lightScheme;

  const AppColors.dark() : colorScheme = darkScheme;

  factory AppColors.fromBrightness(Brightness? brightness) =>
      brightness == Brightness.dark
          ? const AppColors.dark()
          : const AppColors.light();

  final ColorScheme colorScheme;

  static const lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff2b638b),
    surfaceTint: Color(0xff2b638b),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xffcce5ff),
    onPrimaryContainer: Color(0xff001e31),
    secondary: Color(0xff5d5791),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xffe4dfff),
    onSecondaryContainer: Color(0xff19124a),
    tertiary: Color(0xff0c6b59),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xffa1f2db),
    onTertiaryContainer: Color(0xff002019),
    error: Color(0xffba1a1a),
    onError: Color(0xffffffff),
    errorContainer: Color(0xffffdad6),
    onErrorContainer: Color(0xff410002),
    surface: Color(0xfff6fafe),
    onSurface: Color(0xff171c1f),
    onSurfaceVariant: Color(0xff3f4946),
    outline: Color(0xff6f7976),
    outlineVariant: Color(0xffbec9c5),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xff2c3134),
    onInverseSurface: Color(0xffffffff),
    inversePrimary: Color(0xff98ccf9),
    primaryFixed: Color(0xffcce5ff),
    onPrimaryFixed: Color(0xff001e31),
    primaryFixedDim: Color(0xff98ccf9),
    onPrimaryFixedVariant: Color(0xff054b71),
    secondaryFixed: Color(0xffe4dfff),
    onSecondaryFixed: Color(0xff19124a),
    secondaryFixedDim: Color(0xffc6bfff),
    onSecondaryFixedVariant: Color(0xff454078),
    tertiaryFixed: Color(0xffa1f2db),
    onTertiaryFixed: Color(0xff002019),
    tertiaryFixedDim: Color(0xff86d6bf),
    onTertiaryFixedVariant: Color(0xff005142),
    surfaceDim: Color(0xffd6dadf),
    surfaceBright: Color(0xfff6fafe),
    surfaceContainerLowest: Color(0xffffffff),
    surfaceContainerLow: Color(0xfff0f4f8),
    surfaceContainer: Color(0xffeaeef2),
    surfaceContainerHigh: Color(0xffe5e9ed),
    surfaceContainerHighest: Color(0xffdfe3e7),
  );

  static const lightMediumContrastScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff00476d),
    surfaceTint: Color(0xff2b638b),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xff4479a2),
    onPrimaryContainer: Color(0xffffffff),
    secondary: Color(0xff413c73),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xff736ea9),
    onSecondaryContainer: Color(0xffffffff),
    tertiary: Color(0xff004c3e),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xff2f826e),
    onTertiaryContainer: Color(0xffffffff),
    error: Color(0xff8c0009),
    onError: Color(0xffffffff),
    errorContainer: Color(0xffda342e),
    onErrorContainer: Color(0xffffffff),
    surface: Color(0xfff6fafe),
    onSurface: Color(0xff171c1f),
    onSurfaceVariant: Color(0xff3b4542),
    outline: Color(0xff57615e),
    outlineVariant: Color(0xff737d79),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xff2c3134),
    onInverseSurface: Color(0xffffffff),
    inversePrimary: Color(0xff98ccf9),
    primaryFixed: Color(0xff4479a2),
    onPrimaryFixed: Color(0xffffffff),
    primaryFixedDim: Color(0xff286088),
    onPrimaryFixedVariant: Color(0xffffffff),
    secondaryFixed: Color(0xff736ea9),
    onSecondaryFixed: Color(0xffffffff),
    secondaryFixedDim: Color(0xff5a558e),
    onSecondaryFixedVariant: Color(0xffffffff),
    tertiaryFixed: Color(0xff2f826e),
    onTertiaryFixed: Color(0xffffffff),
    tertiaryFixedDim: Color(0xff066856),
    onTertiaryFixedVariant: Color(0xffffffff),
    surfaceDim: Color(0xffd6dadf),
    surfaceBright: Color(0xfff6fafe),
    surfaceContainerLowest: Color(0xffffffff),
    surfaceContainerLow: Color(0xfff0f4f8),
    surfaceContainer: Color(0xffeaeef2),
    surfaceContainerHigh: Color(0xffe5e9ed),
    surfaceContainerHighest: Color(0xffdfe3e7),
  );

  static const lightHighContrastScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff00253b),
    surfaceTint: Color(0xff2b638b),
    onPrimary: Color(0xffffffff),
    primaryContainer: Color(0xff00476d),
    onPrimaryContainer: Color(0xffffffff),
    secondary: Color(0xff201a50),
    onSecondary: Color(0xffffffff),
    secondaryContainer: Color(0xff413c73),
    onSecondaryContainer: Color(0xffffffff),
    tertiary: Color(0xff002820),
    onTertiary: Color(0xffffffff),
    tertiaryContainer: Color(0xff004c3e),
    onTertiaryContainer: Color(0xffffffff),
    error: Color(0xff4e0002),
    onError: Color(0xffffffff),
    errorContainer: Color(0xff8c0009),
    onErrorContainer: Color(0xffffffff),
    surface: Color(0xfff6fafe),
    onSurface: Color(0xff000000),
    onSurfaceVariant: Color(0xff1c2623),
    outline: Color(0xff3b4542),
    outlineVariant: Color(0xff3b4542),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xff2c3134),
    onInverseSurface: Color(0xffffffff),
    inversePrimary: Color(0xffdeeeff),
    primaryFixed: Color(0xff00476d),
    onPrimaryFixed: Color(0xffffffff),
    primaryFixedDim: Color(0xff00304b),
    onPrimaryFixedVariant: Color(0xffffffff),
    secondaryFixed: Color(0xff413c73),
    onSecondaryFixed: Color(0xffffffff),
    secondaryFixedDim: Color(0xff2a255b),
    onSecondaryFixedVariant: Color(0xffffffff),
    tertiaryFixed: Color(0xff004c3e),
    onTertiaryFixed: Color(0xffffffff),
    tertiaryFixedDim: Color(0xff003429),
    onTertiaryFixedVariant: Color(0xffffffff),
    surfaceDim: Color(0xffd6dadf),
    surfaceBright: Color(0xfff6fafe),
    surfaceContainerLowest: Color(0xffffffff),
    surfaceContainerLow: Color(0xfff0f4f8),
    surfaceContainer: Color(0xffeaeef2),
    surfaceContainerHigh: Color(0xffe5e9ed),
    surfaceContainerHighest: Color(0xffdfe3e7),
  );

  static const darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff98ccf9),
    surfaceTint: Color(0xff98ccf9),
    onPrimary: Color(0xff003351),
    primaryContainer: Color(0xff054b71),
    onPrimaryContainer: Color(0xffcce5ff),
    secondary: Color(0xffc6bfff),
    onSecondary: Color(0xff2e295f),
    secondaryContainer: Color(0xff454078),
    onSecondaryContainer: Color(0xffe4dfff),
    tertiary: Color(0xff86d6bf),
    onTertiary: Color(0xff00382d),
    tertiaryContainer: Color(0xff005142),
    onTertiaryContainer: Color(0xffa1f2db),
    error: Color(0xffffb4ab),
    onError: Color(0xff690005),
    errorContainer: Color(0xff93000a),
    onErrorContainer: Color(0xffffdad6),
    surface: Color(0xff0f1417),
    onSurface: Color(0xffdfe3e7),
    onSurfaceVariant: Color(0xffbec9c5),
    outline: Color(0xff89938f),
    outlineVariant: Color(0xff3f4946),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xffdfe3e7),
    onInverseSurface: Color(0xff000000),
    inversePrimary: Color(0xff2b638b),
    primaryFixed: Color(0xffcce5ff),
    onPrimaryFixed: Color(0xff001e31),
    primaryFixedDim: Color(0xff98ccf9),
    onPrimaryFixedVariant: Color(0xff054b71),
    secondaryFixed: Color(0xffe4dfff),
    onSecondaryFixed: Color(0xff19124a),
    secondaryFixedDim: Color(0xffc6bfff),
    onSecondaryFixedVariant: Color(0xff454078),
    tertiaryFixed: Color(0xffa1f2db),
    onTertiaryFixed: Color(0xff002019),
    tertiaryFixedDim: Color(0xff86d6bf),
    onTertiaryFixedVariant: Color(0xff005142),
    surfaceDim: Color(0xff0f1417),
    surfaceBright: Color(0xff353a3d),
    surfaceContainerLowest: Color(0xff0a0f12),
    surfaceContainerLow: Color(0xff171c1f),
    surfaceContainer: Color(0xff1c2023),
    surfaceContainerHigh: Color(0xff262b2e),
    surfaceContainerHighest: Color(0xff313539),
  );

  static const darkMediumContrastScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xff9cd0fe),
    surfaceTint: Color(0xff98ccf9),
    onPrimary: Color(0xff001829),
    primaryContainer: Color(0xff6296c0),
    onPrimaryContainer: Color(0xff000000),
    secondary: Color(0xffcbc4ff),
    onSecondary: Color(0xff130b44),
    secondaryContainer: Color(0xff908ac7),
    onSecondaryContainer: Color(0xff000000),
    tertiary: Color(0xff8adac3),
    onTertiary: Color(0xff001b14),
    tertiaryContainer: Color(0xff4f9f8a),
    onTertiaryContainer: Color(0xff000000),
    error: Color(0xffffbab1),
    onError: Color(0xff370001),
    errorContainer: Color(0xffff5449),
    onErrorContainer: Color(0xff000000),
    surface: Color(0xff0f1417),
    onSurface: Color(0xfff8fbff),
    onSurfaceVariant: Color(0xffc3cdc9),
    outline: Color(0xff9ba5a1),
    outlineVariant: Color(0xff7b8582),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xffdfe3e7),
    onInverseSurface: Color(0xff000000),
    inversePrimary: Color(0xff084c73),
    primaryFixed: Color(0xffcce5ff),
    onPrimaryFixed: Color(0xff001321),
    primaryFixedDim: Color(0xff98ccf9),
    onPrimaryFixedVariant: Color(0xff003959),
    secondaryFixed: Color(0xffe4dfff),
    onSecondaryFixed: Color(0xff0e0540),
    secondaryFixedDim: Color(0xffc6bfff),
    onSecondaryFixedVariant: Color(0xff342f66),
    tertiaryFixed: Color(0xffa1f2db),
    onTertiaryFixed: Color(0xff00150f),
    tertiaryFixedDim: Color(0xff86d6bf),
    onTertiaryFixedVariant: Color(0xff003e32),
    surfaceDim: Color(0xff0f1417),
    surfaceBright: Color(0xff353a3d),
    surfaceContainerLowest: Color(0xff0a0f12),
    surfaceContainerLow: Color(0xff171c1f),
    surfaceContainer: Color(0xff1c2023),
    surfaceContainerHigh: Color(0xff262b2e),
    surfaceContainerHighest: Color(0xff313539),
  );

  static const darkHighContrastScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xfff9fbff),
    surfaceTint: Color(0xff98ccf9),
    onPrimary: Color(0xff000000),
    primaryContainer: Color(0xff9cd0fe),
    onPrimaryContainer: Color(0xff000000),
    secondary: Color(0xfffef9ff),
    onSecondary: Color(0xff000000),
    secondaryContainer: Color(0xffcbc4ff),
    onSecondaryContainer: Color(0xff000000),
    tertiary: Color(0xffecfff7),
    onTertiary: Color(0xff000000),
    tertiaryContainer: Color(0xff8adac3),
    onTertiaryContainer: Color(0xff000000),
    error: Color(0xfffff9f9),
    onError: Color(0xff000000),
    errorContainer: Color(0xffffbab1),
    onErrorContainer: Color(0xff000000),
    surface: Color(0xff0f1417),
    onSurface: Color(0xffffffff),
    onSurfaceVariant: Color(0xfff3fdf9),
    outline: Color(0xffc3cdc9),
    outlineVariant: Color(0xffc3cdc9),
    shadow: Color(0xff000000),
    scrim: Color(0xff000000),
    inverseSurface: Color(0xffdfe3e7),
    onInverseSurface: Color(0xff000000),
    inversePrimary: Color(0xff002d47),
    primaryFixed: Color(0xffd4e9ff),
    onPrimaryFixed: Color(0xff000000),
    primaryFixedDim: Color(0xff9cd0fe),
    onPrimaryFixedVariant: Color(0xff001829),
    secondaryFixed: Color(0xffe9e3ff),
    onSecondaryFixed: Color(0xff000000),
    secondaryFixedDim: Color(0xffcbc4ff),
    onSecondaryFixedVariant: Color(0xff130b44),
    tertiaryFixed: Color(0xffa6f7df),
    onTertiaryFixed: Color(0xff000000),
    tertiaryFixedDim: Color(0xff8adac3),
    onTertiaryFixedVariant: Color(0xff001b14),
    surfaceDim: Color(0xff0f1417),
    surfaceBright: Color(0xff353a3d),
    surfaceContainerLowest: Color(0xff0a0f12),
    surfaceContainerLow: Color(0xff171c1f),
    surfaceContainer: Color(0xff1c2023),
    surfaceContainerHigh: Color(0xff262b2e),
    surfaceContainerHighest: Color(0xff313539),
  );
}

extension ContextColorMapping on BuildContext {
  Color get hint => colorScheme.outlineVariant;
  Color get subtitle => colorScheme.onSurfaceVariant;
  Color get dark => _kDarkColor;
  Color get onDark => _kLightColor;
  Color get light => _kLightColor;
  Color get onLight => _kDarkColor;
}

extension TextStyleColorMapping on TextStyle {
  TextStyle hint([BuildContext? context]) =>
      withColor(context?.hint ?? color?.hinted);

  TextStyle subtitle(BuildContext context) => withColor(context.subtitle);

  TextStyle focused() => withColor(color?.focused);

  TextStyle onDark(BuildContext context) => withColor(context.onDark);

  TextStyle onLight(BuildContext context) => withColor(context.onLight);
}

extension StringColor on String {
  /// Returns random color seeded with [hashCode] of the string
  Color get color => _Colors.random(this);
}

class _Colors {
  const _Colors._();

  static const charcoal = Color(0xff252525);
  static const livid = Color(0xff395b74);
  static const lividLight = Color(0xff78909c);
  static const lividDark = Color(0xff2d495e);
  static const amber = Color(0xffffca28);
  static const orange = Color(0xffe5680f);
  static const orangeEve = Color(0xffe84d01);
  static const brown = Color(0xff795548);
  static const red = Color(0xffd50000);
  static const redLight = Color(0xffef5350);
  static const redDark = Color(0xffb40000);
  static const cherry = Color(0xffc72349);
  static const cherryDark = Color(0xffaf1e40);
  static const pink = Color(0xffad1457);
  static const pinkLight = Color(0xffec407a);
  static const pinkDark = Color(0xff790e3c);
  static const sky = Color(0xff1E88E5);
  static const skyLight = Color(0xff42a5f5);
  static const blue = Color(0xff1769aa);
  static const blueDark = Color(0xff14578c);
  static const indigoLight = Color(0xff5c6bc0);
  static const indigoDark = Color(0xff2c387e);
  static const purple = Color(0xff9c27b0);
  static const purpleDark = Color(0xff6d1b7b);
  static const purpleEve = Color(0xff723b48);
  static const violet = Color(0xff673ab7);
  static const violetDark = Color(0xff482880);
  static const plum = Color(0xff625b91);
  static const plumDark = Color(0xff514a78);
  static const teal = Color(0xff039694);
  static const tealDark = Color(0xff006974);
  static const green = Color(0xff0F9D58);
  static const greenLight = Color(0xff7cb342);
  static const greenLighter = Color(0xff66bb6a);
  static const greenDark = Color(0xff0d844a);

  static Color random(String seed) => colors[seed.random(colors.length)];

  static const colors = [
    charcoal,
    Colors.lightBlueAccent,
    livid,
    Colors.teal,
    amber,
    pinkDark,
    orange,
    Colors.indigoAccent,
    pinkLight,
    Colors.lightBlue,
    redLight,
    Colors.green,
    cherry,
    Colors.lightGreen,
    purpleEve,
    greenDark,
    Colors.blueAccent,
    violet,
    Colors.blueGrey,
    greenLighter,
    Colors.deepOrangeAccent,
    cherryDark,
    lividDark,
    Colors.blue,
    pink,
    skyLight,
    Colors.greenAccent,
    indigoDark,
    green,
    Colors.pinkAccent,
    plum,
    Colors.orange,
    indigoLight,
    Colors.pink,
    orangeEve,
    Colors.amber,
    sky,
    red,
    Colors.orangeAccent,
    purpleDark,
    greenLight,
    blue,
    Colors.deepPurple,
    redDark,
    Colors.purple,
    plumDark,
    purple,
    teal,
    Colors.indigo,
    violetDark,
    tealDark,
    Colors.purpleAccent,
    blueDark,
    lividLight,
    Colors.deepPurpleAccent,
    brown,
  ];
}
