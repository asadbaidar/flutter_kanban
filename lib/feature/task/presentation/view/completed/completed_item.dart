import 'package:core/feature/task/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';

class TaskCompletedItem extends StatelessWidget {
  const TaskCompletedItem({
    super.key,
    required this.item,
  });

  final TaskCompleted item;

  @override
  Widget build(BuildContext context) {
    final isReopening = context.select(
      (TaskCompletedBloc bloc) => bloc.state.isTaskReopening(item.taskId!),
    );
    return TaskCompletedCard(
      item: item,
      loading: isReopening,
      onTap: () => showCupertinoModalPopup<void>(
        context: context,
        builder: (context) => TaskActionPopup(
          action: LocaleStrings.reopen,
          onAction: () =>
              context.read<TaskCompletedBloc>().reopenTask(item.taskId!),
        ),
      ),
    );
  }
}
