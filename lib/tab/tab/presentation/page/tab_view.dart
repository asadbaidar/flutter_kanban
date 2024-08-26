import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:core/tab/tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return LifecycleObserver(
      key: ValueKey(context.newTab),
      onInit: () {
        final tab = context.newTab;
        if (tab != null) context.read<TabBloc>().changeTab(tab);
      },
      child: const _TabScafold(),
    );
  }
}

class _TabScafold extends StatelessWidget {
  const _TabScafold();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.surfaceContainerNavBarTheme,
      child: BlocBuilder<TabBloc, TabState>(
        builder: (context, state) {
          return Scaffold(
            body: _TabBody(state.currentTab),
            bottomNavigationBar: BottomNavBar(
              currentTab: state.currentTab,
              onSelect: (tab) => context
                  .read<TabBloc>()
                  .changeTab(tab, router: context.router),
            ),
            floatingActionButton: const TaskCreateButton(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        },
      ),
    );
  }
}

class _TabBody extends StatelessWidget {
  const _TabBody(this.currentTab);

  final TabItem currentTab;

  @override
  Widget build(BuildContext context) {
    switch (currentTab) {
      case TabItem.home:
        return const HomePage();
      case TabItem.board:
        return const BoardPage();
      default:
        return const SizedBox.shrink();
    }
  }
}
