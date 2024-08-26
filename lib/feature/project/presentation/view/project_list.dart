import 'package:common/common.dart';
import 'package:core/feature/project/project.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return ProjectTile(
          value: projects[index],
          selected: selected,
          onChanged: context.read<ProjectBloc>().selectProject,
        );
      },
    );
  }
}
