import 'package:common/common.dart';
import 'package:core/feature/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: LocaleStrings.selectProject,
      body: const _ProjectBody(),
    );
  }
}

class _ProjectBody extends StatelessWidget {
  const _ProjectBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        return state.projectDataState.when(
          otherwise: (_) => const CustomProgress.medium(),
          failure: (data) => CustomError(
            isFailure: data.isFailure,
            emptyMessage: LocaleStrings.emptyMessage(),
            message: data.errorMessage,
          ),
          loaded: (data) {
            return ProjectListView(
              projects: data.value ?? [],
              selected: state.selectedOrFirst,
            );
          },
        );
      },
    );
  }
}
