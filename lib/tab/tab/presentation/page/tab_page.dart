
import 'package:common/common.dart';
import 'package:core/tab/tab.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabPage extends StatelessWidget {
  const TabPage({
    super.key,
    required this.page,
  });

  final String page;

  static String path() => '/tab/:page';

  static String route([TabItem? tab]) => RouteUri.tab(tab?.name ?? _firstTab);

  static String get _firstTab => TabItem.items.first.name;

  TabItem get _tab => TabItem.fromName(page);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabCubit(initialTab: _tab),
      child: const TabView(),
    );
  }
}

extension TabContext on BuildContext {
  TabItem get currentTab => read<TabCubit>().state.currentTab;

  TabItem? get newTab => TabItem.fromName(routePathParameters['page']);
}
