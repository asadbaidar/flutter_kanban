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

  static String route([TabItem? tab]) => RouteUri.tab(tab?.name ?? _defaultTab);

  static String get _defaultTab => TabItem.items.last.name;

  TabItem get _tab => TabItem.fromName(page);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabBloc(initialTab: _tab),
      child: const TabContent(),
    );
  }
}

extension TabContext on BuildContext {
  TabItem get currentTab => read<TabBloc>().state.currentTab;

  TabItem? get newTab => TabItem.fromName(routePathParameters['page']);
}
