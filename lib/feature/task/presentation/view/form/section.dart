import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskSectionInput extends StatelessWidget {
  const TaskSectionInput({super.key});

  @override
  Widget build(BuildContext context) {
    final task = context.select((TaskFormBloc bloc) => bloc.state.task);
    final isMoving = task != null &&
        context.select(
          (TaskBloc bloc) => bloc.state.isTaskMoveing(task),
        );
    return BlocListener<TaskFormBloc, TaskFormState>(
      listenWhen: (previous, current) =>
          previous.sectionId != current.sectionId,
      listener: (context, state) {
        if (task != null) {
          context.read<TaskBloc>().moveTask(
                task,
                toSection: state.sectionId.value,
              );
        }
      },
      child: _TaskSectionView(loading: isMoving),
    );
  }
}

class _TaskSectionView extends StatelessWidget {
  const _TaskSectionView({this.loading = false});

  final bool loading;

  @override
  Widget build(BuildContext context) {
    final sections = context.select((SectionBloc bloc) => bloc.state.sections);
    return LifecycleObserver(
      onInit: () =>
          context.read<TaskFormBloc>().initSectionId(sections.firstOrNull?.id),
      child: _TaskSectionDropDown(
        sections: sections,
        loading: loading,
      ),
    );
  }
}

class _TaskSectionDropDown extends StatelessWidget {
  const _TaskSectionDropDown({
    required this.sections,
    this.loading = false,
  });

  final List<Section> sections;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskFormBloc, TaskFormState>(
      buildWhen: (previous, current) => previous.sectionId != current.sectionId,
      builder: (context, state) {
        final section = sections.getById(state.sectionId.value);
        return CustomTagView.dropDown(
          text: section?.name ?? 'Section',
          foreground: section?.color(context),
          enabled: !loading,
          loading: loading,
          onTap: () => _showDropDown(
            context,
            selected: state.sectionId.value,
            items: sections,
          ),
        );
      },
    );
  }

  void _showDropDown(
    BuildContext context, {
    String? selected,
    required List<Section> items,
  }) {
    final formBloc = context.read<TaskFormBloc>();
    showMenu<String>(
      context: context,
      position: context.getPosition(offset: const Offset(16, 0)),
      initialValue: selected,
      items: items.map(
        (item) {
          return PopupMenuItem(
            value: item.id,
            child: Text(item.name ?? ''),
          );
        },
      ).toList(),
    ).then(formBloc.sectionIdChanged);
  }
}
