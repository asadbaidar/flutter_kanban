part of 'locale.dart';

class LocaleStrings {
  LocaleStrings._(); // coverage:ignore-line

  static String get appName => 'appName'.tr();

  static String get save => 'save'.tr();

  static String get discard => 'discard'.tr();

  static String get saveChanges => 'saveChanges'.tr();

  static String get saveChangesSubtitle => 'saveChangesSubtitle'.tr();

  static String get done => 'done'.tr();

  static String get cancel => 'cancel'.tr();

  static String get yes => 'yes'.tr();

  static String get no => 'no'.tr();

  static String get next => 'next'.tr();

  static String get apply => 'apply'.tr();

  static String get retry => 'retry'.tr();

  static String get welcome => 'welcome'.tr();

  static String get selectProject => 'selectProject'.tr();

  static String get menu => 'menu'.tr();

  static String get logOut => 'logOut'.tr();

  static String get home => 'home'.tr();

  static String get board => 'board'.tr();

  static String get data => 'data'.tr();

  static String get projects => 'projects'.tr();

  static String emptyMessage([String? value]) =>
      'emptyMessage'.tr(args: [value ?? LocaleStrings.data]);
}
