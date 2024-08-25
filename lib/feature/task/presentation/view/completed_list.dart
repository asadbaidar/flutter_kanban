import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';

class CompletedTaskView extends StatelessWidget {
  const CompletedTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    final sections = context.select((SectionBloc bloc) => bloc.state.sections);
    return BlocBuilder<TaskCompletedBloc, TaskCompletedState>(
      builder: (context, state) {
        return state.dataState.when(
          otherwise: (_) => const CustomProgress.medium(),
          failure: (data) => CustomError(
            isFailure: data.isFailure,
            message: data.errorMessage,
            onRetry: context.read<TaskCompletedBloc>().getCompletedTasks,
          ),
          loaded: (data) {
            final items = state.tasks;
            if (items.isEmpty) {
              return CustomError(
                emptyMessage: LocaleStrings.emptyMessage('completed'),
              );
            }
            return _CompletedList(
              items: items,
              sections: sections,
            );
          },
        );
      },
    );
  }
}

class _CompletedHeader extends StatelessWidget {
  const _CompletedHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Text(
            'Completed',
            style: context.title2,
          ),
        ),
      ],
    );
  }
}

class _CompletedList extends StatelessWidget {
  const _CompletedList({
    required this.items,
    required this.sections,
  });

  final List<CompletedTask> items;
  final List<Section> sections;

  @override
  Widget build(BuildContext context) {
    return SmartListView.builder(
      padding: const EdgeInsets.all(16.0),
      headerBuilder: (_) => const _CompletedHeader(),
      footerBuilder: (_) => const SizedBox(height: 40),
      items: items,
      itemBuilder: (context, index, item) {
        return _CompletedItem(
          item: item!,
          sections: sections,
        );
      },
    );
  }
}

class _CompletedItem extends StatelessWidget {
  const _CompletedItem({
    required this.item,
    required this.sections,
  });

  final CompletedTask item;
  final List<Section> sections;

  @override
  Widget build(BuildContext context) {
    final isReopening = context.select(
      (TaskCompletedBloc bloc) => bloc.state.isTaskReopening(item.taskId!),
    );
    return TaskCompletedCard(
      item: item,
      section: sections.getById(item.sectionId),
      loading: isReopening,
      onTap: () => showCupertinoModalPopup<void>(
        context: context,
        builder: (context) => TaskActionSheet(
          action: 'Reopen',
          onAction: () =>
              context.read<TaskCompletedBloc>().reopenTask(item.taskId!),
        ),
      ),
    );
  }
}
