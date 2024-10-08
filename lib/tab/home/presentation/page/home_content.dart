import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:core/tab/home/home.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        customTitle: TitleView(),
        actions: [LocaleButton(), TaskSyncButton()],
      ),
      body: _HomeBody(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    return const TaskCompletedView();
  }
}
