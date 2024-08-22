import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:core/tab/home/presentation/view/view.dart';
import 'package:flutter/material.dart';

class BoardView extends StatelessWidget {
  const BoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        customTitle: TitleView(),
      ),
      body: _BoardBody(),
    );
  }
}

class _BoardBody extends StatelessWidget {
  const _BoardBody();

  @override
  Widget build(BuildContext context) {
    return const TaskView();
  }
}
