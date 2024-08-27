import 'package:common/common.dart';
import 'package:core/feature/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SelectProjectView extends StatelessWidget {
  const SelectProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        return state.dataState.when(
          orElse: (_) => const Padding(
            padding: EdgeInsets.only(top: 6),
            child: CustomProgress.small(centered: false),
          ),
          loaded: (_) => ProjectDropdownButton(
            selected: state.selectedOrFirst,
            onTap: () => context.go(ProjectPage.route(context.currentRoute)),
          ),
        );
      },
    );
  }
}
