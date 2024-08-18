import 'package:common/common.dart';
import 'package:core/tab/board/presentation/page/board_view.dart';
import 'package:core/tab/tab.dart';
import 'package:flutter/material.dart';

class BoardPage extends StatelessWidget {
  const BoardPage({super.key});

  static String route() => RouteUri.tab(subroute());

  static String subroute() => TabItem.board.name;

  @override
  Widget build(BuildContext context) {
    return const BoardView();
  }
}
