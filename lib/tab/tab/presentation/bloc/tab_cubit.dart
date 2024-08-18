import 'package:common/common.dart';
import 'package:core/tab/tab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
