import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/cupertino.dart';
import 'package:locale/locale.dart';

class TaskCompletedList extends StatelessWidget {
  const TaskCompletedList({
    super.key,
    required this.items,
  });

  final List<TaskCompleted> items;

  @override
  Widget build(BuildContext context) {
    return SmartListView.builder(
      padding: const EdgeInsets.all(16.0),
      headerBuilder: (_) => HeaderText(
        LocaleStrings.completed,
        trailing: CustomTagView(
          text: items.length.toString(),
          foreground: context.secondary,
        ),
      ),
      footerBuilder: (_) => const SizedBox(height: 40),
      items: items,
      itemBuilder: (context, index, item) {
        return TaskCompletedItem(item: item!);
      },
    );
  }
}
