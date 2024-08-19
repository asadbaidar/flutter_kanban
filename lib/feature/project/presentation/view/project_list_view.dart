import 'package:common/common.dart';
import 'package:core/feature/project/project.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProjectListView extends StatelessWidget {
  const ProjectListView({
    super.key,
    required this.projects,
    required this.selected,
  });

  final List<Project> projects;
  final Project? selected;

  @override
  Widget build(BuildContext context) {
    return CustomListView(
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return _ProjectTile(
          value: projects[index],
          selected: selected,
        );
      },
    );
  }
}

class _ProjectTile extends StatelessWidget {
  const _ProjectTile({
    required this.value,
    required this.selected,
  });

  final Project value;
  final Project? selected;

  @override
  Widget build(BuildContext context) {
    return CustomRadioListTile(
      title: value.name,
      value: value,
      groupValue: selected,
      onChanged: (v) => context
        ..pop()
        ..read<ProjectBloc>().selectProject(v),
    );
  }
}
