import 'package:core/feature/task/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskCompletedItem extends StatelessWidget {
  const TaskCompletedItem({
    super.key,
    required this.item,
    required this.sections,
  });

  final TaskCompleted item;
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
        builder: (context) => TaskActionPopup(
          action: 'Reopen',
          onAction: () =>
              context.read<TaskCompletedBloc>().reopenTask(item.taskId!),
        ),
      ),
    );
  }
}
