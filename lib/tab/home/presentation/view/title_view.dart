import 'package:common/common.dart';
import 'package:core/feature/project/project.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';

class TitleView extends StatelessWidget {
  const TitleView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: const [
        ProjectListener(),
        TaskCloseListener(),
        TaskReopenListener(),
      ],
      child: CustomListTile(
        title: LocaleStrings.appName,
        titleStyle: context.logo,
        titleMaxLines: 1,
        customSubtitle: const SelectProjectView(),
      ),
    );
  }
}
