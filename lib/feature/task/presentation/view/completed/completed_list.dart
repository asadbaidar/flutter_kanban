import 'package:common/common.dart';
import 'package:core/feature/task/task.dart';
import 'package:flutter/cupertino.dart';

class TaskCompletedList extends StatelessWidget {
  const TaskCompletedList({
    super.key,
    required this.items,
    required this.sections,
  });

  final List<TaskCompleted> items;
  final List<Section> sections;

  @override
  Widget build(BuildContext context) {
    return SmartListView.builder(
      padding: const EdgeInsets.all(16.0),
      headerBuilder: (_) => const HeaderText('Completed'),
      footerBuilder: (_) => const SizedBox(height: 40),
      items: items,
      itemBuilder: (context, index, item) {
        return TaskCompletedItem(
          item: item!,
          sections: sections,
        );
      },
    );
  }
}
