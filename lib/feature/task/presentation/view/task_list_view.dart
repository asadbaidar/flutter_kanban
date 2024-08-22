import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:locale/locale.dart';

final _dragKey = GlobalKey();

class TaskListView extends StatelessWidget {
  const TaskListView({
    super.key,
    required this.items,
    required this.section,
    required this.itemSize,
    required this.onDragStart,
    required this.onDragEnd,
  });

  final Section section;
  final List<Task> items;
  final Size itemSize;
  final OnValue<Task> onDragStart;
  final VoidCallback onDragEnd;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      buildWhen: (previous, current) =>
          previous.draggingTask != current.draggingTask ||
          previous.taskMoveState != current.taskMoveState,
      builder: (context, state) {
        if (items.isEmpty) {
          return CustomError(
            emptyMessage: LocaleStrings.emptyMessage(section.name?.lowercase),
          );
        }

        final draggingItem = state.draggingTask;
        return CustomListView(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return DraggableTaskItem(
              section: section,
              item: item,
              size: itemSize,
              loading: state.isMoveInProgress(item),
              dragging: item == draggingItem,
              dragKey: _dragKey,
              onDragStart: onDragStart,
              onDragEnd: onDragEnd,
            );
          },
        );
      },
    );
  }
}
