part of 'view.dart';

class TabView extends StatelessWidget {
  const TabView({super.key});

  @override
  Widget build(BuildContext context) {
    return LifecycleObserver(
      key: ValueKey(context.newTab),
      onInit: () {
        final tab = context.newTab;
        if (tab != null) context.read<TabCubit>().changeTab(tab);
      },
      child: const _TabView(),
    );
  }
}

class _TabView extends StatelessWidget {
  const _TabView();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: context.bottomNavigationBarTheme,
      child: BlocBuilder<TabCubit, TabState>(
        builder: (context, state) {
          return Scaffold(
            body: _TabBody(state.currentTab),
            bottomNavigationBar: _BottomNavBar(
              currentTab: state.currentTab,
            ),
            floatingActionButton: const CreateTaskButton(),
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
        return Center(child: Text(LocaleStrings.board));
      default:
        return const SizedBox.shrink();
    }
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({required this.currentTab});

  final TabItem currentTab;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentTab.$index,
      destinations: TabItem.items.map(_buildItemView).toList(),
      onDestinationSelected: (index) {
        if (index == TabItem.blank.$index) return;
        context.read<TabCubit>().changeTab(
              TabItem.items[index],
              router: context.router,
            );
      },
    );
  }

  Widget _buildItemView(TabItem tab) => _TabItemView(
        tab,
        selected: tab == currentTab,
      );
}

class _TabItemView extends StatelessWidget {
  const _TabItemView(
    this.tab, {
    this.selected = false,
  });

  final TabItem tab;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return tab == TabItem.blank
        ? const SizedBox.shrink()
        : NavigationDestination(
            icon: AssetIcon.monotone(tab.icon),
            label: tab.title,
          );
  }
}

class CreateTaskButton extends StatelessWidget {
  const CreateTaskButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}
