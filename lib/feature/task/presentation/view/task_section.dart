import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _pageKey = PageViewKey();
const _horizontalPadding = 16.0;
const _viewportFraction = 0.9;
const _itemHeight = 113.0;

class TaskSectionView extends StatelessWidget {
  const TaskSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      buildWhen: (previous, current) => previous.dataState != current.dataState,
      builder: (context, state) {
        return state.dataState.when(
          orElse: (_) => const CustomProgress.medium(),
          failure: (data) => CustomError(
            isFailure: data.isFailure,
            message: data.errorMessage,
            onRetry: () => context.read<TaskBloc>().getTasks(),
          ),
          loaded: (data) => _TaskSectionBuilder(
            sectionTasks: state.sectionTasks,
          ),
        );
      },
    );
  }
}

class _TaskSectionBuilder extends StatelessWidget {
  const _TaskSectionBuilder({required this.sectionTasks});

  final SectionTasks sectionTasks;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SectionBloc, SectionState>(
      buildWhen: (previous, current) => previous.sections != current.sections,
      builder: (context, state) {
        return _TaskSectionPageView(
          sections: state.sections,
          sectionTasks: sectionTasks,
        );
      },
    );
  }
}

class _TaskSectionPageView extends StatelessWidget {
  const _TaskSectionPageView({
    required this.sections,
    required this.sectionTasks,
  });

  final List<Section> sections;
  final SectionTasks sectionTasks;

  @override
  Widget build(BuildContext context) {
    final itemSize = Size(
      (context.screenWidth * _viewportFraction) - _horizontalPadding,
      _itemHeight,
    );

    return CustomPageView(
      key: _pageKey,
      horizontalPadding: _horizontalPadding,
      viewportFraction: _viewportFraction,
      itemCount: sections.length,
      builder: (context, index) {
        final section = sections[index];
        final tasks = sectionTasks[section.id] ?? [];
        return SectionContainer(
          section: SectionCard(
            section,
            count: tasks.length,
          ),
          child: CustomDragTarget(
            initialOffset: _horizontalPadding,
            scrollController: _pageKey.controller,
            items: tasks,
            onAccept: (task) =>
                context.read<TaskBloc>().moveTask(task, toSection: section.id!),
            child: TaskListView(
              items: tasks,
              section: section,
              itemSize: itemSize,
              onDragStart: (value) {
                _pageKey.enablePageSnapping(false);
                context.read<TaskBloc>().onDragStart(value);
              },
              onDragEnd: () {
                _pageKey.enablePageSnapping(true);
                context.read<TaskBloc>().onDragEnd();
              },
            ),
          ),
        );
      },
    );
  }
}
