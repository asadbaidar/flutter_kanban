part of 'bloc.dart';

class TabState extends Equatable {
  const TabState({
    required this.currentTab,
  });

  final TabItem currentTab;

  @override
  List<Object> get props => [currentTab];

  int get currentTabIndex => TabItem.items.indexOf(currentTab);
}

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

  static const List<TabItem> items = [
    home,
    // blank,
    board,
  ];
}

extension TabItemHelper on TabItem {
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

  int get $index => TabItem.items.indexOf(this);
}
