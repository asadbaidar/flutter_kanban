part of 'locale.dart';

class LocaleConstants {
  const LocaleConstants._(); // coverage:ignore-line

  static String kAssetPath = 'packages/locale/translations';

  static const enUS = Locale('en', 'US');
  static const esES = Locale('es', 'ES');

  static const List<Locale> supported = [
    enUS,
    esES,
  ];
}
