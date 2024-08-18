import 'package:common/common.dart';
import 'package:core/tab/tab.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentTab,
    required this.onSelect,
  });

  final TabItem currentTab;
  final OnValue<TabItem> onSelect;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentTab.$index,
      destinations: TabItem.items.map(_buildItemView).toList(),
      onDestinationSelected: (index) {
        if (index == TabItem.blank.$index) return;
        onSelect(TabItem.items[index]);
      },
    );
  }

  Widget _buildItemView(TabItem tab) => TabItemView(
        tab,
        selected: tab == currentTab,
      );
}
