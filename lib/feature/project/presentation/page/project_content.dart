import 'package:common/common.dart';
import 'package:core/feature/project/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';

class ProjectContent extends StatelessWidget {
  const ProjectContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBottomSheet(
        title: LocaleStrings.selectProject,
        body: const _ProjectView(),
      ),
    );
  }
}

class _ProjectView extends StatelessWidget {
  const _ProjectView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        return state.dataState.when(
          orElse: (_) => const CustomProgress.medium(),
          failure: (data) => CustomError(
            isFailure: data.isFailure,
            message: data.errorMessage,
          ),
          loaded: (data) {
            final list = data.value ?? [];

            if (list.isEmpty) {
              return const CustomError(
                emptyMessage: 'No project found',
              );
            }
            return ProjectListView(
              projects: list,
              selected: state.selectedOrFirst,
            );
          },
        );
      },
    );
  }
}
