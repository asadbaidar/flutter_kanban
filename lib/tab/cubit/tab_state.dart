part of 'tab_cubit.dart';

class TabState extends Equatable {
  const TabState({
    required this.currentTab,
  });

  final TabItem currentTab;

  @override
  List<Object> get props => [currentTab];

  int get currentTabIndex => TabItem.items.indexOf(currentTab);
}
