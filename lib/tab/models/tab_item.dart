part of 'models.dart';

enum TabItem {
  home(AssetIcons.home),
  blank(AssetIcons.blank),
  board(AssetIcons.hub),
  ;

  const TabItem(this.icon);

  factory TabItem.fromName(String? name) => name?.notBlank == null
      ? home
      : items.firstWhereOrNull((e) => e.name == name) ?? home;

  final AssetIcons icon;

  String get title {
    switch (this) {
      case TabItem.home:
        return LocaleStrings.home;
      case TabItem.board:
        return LocaleStrings.board;
      default:
        return '';
    }
  }

  String get path => 'tab/$name';

  int get $index => items.indexOf(this);

  static const List<TabItem> items = [
    home,
    // blank,
    board,
  ];
}
