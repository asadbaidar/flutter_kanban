import 'package:core/feature/project/presentation/presentation.dart';
import 'package:core/feature/task/presentation/presentation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/single_child_widget.dart';

class ProjectListener extends SingleChildStatelessWidget {
  const ProjectListener({super.key, super.child});

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return BlocListener<ProjectBloc, ProjectState>(
      listener: (context, state) {
        context.read<TaskBloc>().projectChanged(state.selectedOrFirst);
        context.read<SectionBloc>().projectChanged(state.selectedOrFirst);
        context.read<TaskCompletedBloc>().projectChanged(state.selectedOrFirst);
      },
      child: child,
    );
  }
}
