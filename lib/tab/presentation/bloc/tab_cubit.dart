part of 'bloc.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit({
    required TabItem initialTab,
  }) : super(TabState(currentTab: initialTab));

  void changeTab(TabItem tab, {GoRouter? router}) {
    if (tab == state.currentTab) return;

    $debugPrint(tab, tag: 'tab.change');
    router?.go(TabPage.route(tab));
    emit(TabState(currentTab: tab));
  }
}
