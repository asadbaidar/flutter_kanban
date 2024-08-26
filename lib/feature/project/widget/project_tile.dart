import 'package:common/common.dart';
import 'package:core/feature/project/project.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class ProjectTile extends StatelessWidget {
  const ProjectTile({
    super.key,
    required this.value,
    required this.selected,
    required this.onChanged,
  });

  final Project value;
  final Project? selected;
  final ValueChanged<Project?> onChanged;

  @override
  Widget build(BuildContext context) {
    return CustomRadioListTile(
      title: value.name,
      value: value,
      groupValue: selected,
      onChanged: (v) {
        onChanged(v);
        context.pop();
      },
    );
  }
}
