part of 'locale.dart';

class LocaleStrings {
  LocaleStrings._(); // coverage:ignore-line

  static String get appName => 'appName'.tr();

  static String get save => 'save'.tr();

  static String get discard => 'discard'.tr();

  static String get done => 'done'.tr();

  static String get cancel => 'cancel'.tr();

  static String get retry => 'retry'.tr();

  static String get selectProject => 'selectProject'.tr();

  static String get menu => 'menu'.tr();

  static String get home => 'home'.tr();

  static String get board => 'board'.tr();

  static String get projects => 'projects'.tr();

  static String get available => 'available'.tr();

  static String emptyMessage([String? value]) =>
      'emptyMessage'.tr(args: [value ?? LocaleStrings.available]);

  static String get commentPosted => 'commentPosted'.tr();

  static String get taskClosed => 'taskClosed'.tr();

  static String get taskReopened => 'taskReopened'.tr();

  static String get taskCreated => 'taskCreated'.tr();

  static String get taskUpdated => 'taskUpdated'.tr();

  static String get discardChanges => 'discardChanges'.tr();

  static String get discardMessage => 'discardMessage'.tr();

  static String taskConfirmMessage(String? action) =>
      'taskConfirmMessage'.tr(args: [action ?? '']);

  static String get comments => 'comments'.tr();

  static String get me => 'me'.tr();

  static String get sync => 'sync'.tr();

  static String get reopen => 'reopen'.tr();

  static String get completed => 'completed'.tr();

  static String get complete => 'complete'.tr();

  static String get summary => 'summary'.tr();

  static String get description => 'description'.tr();

  static String get section => 'section'.tr();

  static String get continueText => 'continueText'.tr();
}
