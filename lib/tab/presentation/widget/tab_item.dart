import 'package:common/common.dart';
import 'package:core/tab/tab.dart';
import 'package:flutter/material.dart';

class TabItemView extends StatelessWidget {
  const TabItemView(
    this.tab, {
    super.key,
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
