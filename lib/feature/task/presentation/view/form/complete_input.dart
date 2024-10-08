import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';

class TaskCompleteInput extends StatelessWidget {
  const TaskCompleteInput({super.key});

  @override
  Widget build(BuildContext context) {
    final id = context.select((TaskFormBloc bloc) => bloc.state.id);
    final isClosing = id.isNotEmpty &&
        context.select(
          (TaskCompletedBloc bloc) => bloc.state.isTaskClosing(id),
        );
    if (id.isEmpty) return const SizedBox.shrink();

    return CustomTagView.dropDown(
      text: LocaleStrings.complete,
      foreground: context.onSurface,
      loading: isClosing,
      onTap: () => showCupertinoModalPopup<void>(
        context: context,
        builder: (context) => TaskActionPopup(
          action: LocaleStrings.complete,
          onAction: () => context.read<TaskCompletedBloc>().closeTask(id),
        ),
      ),
    );
  }
}
