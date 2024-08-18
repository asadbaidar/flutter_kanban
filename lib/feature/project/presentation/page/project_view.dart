import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:locale/locale.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: LocaleStrings.selectProject,
      ),
      body: const _ProjectBody(),
    );
  }
}

class _ProjectBody extends StatelessWidget {
  const _ProjectBody();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(LocaleStrings.projects),
    );
  }
}
