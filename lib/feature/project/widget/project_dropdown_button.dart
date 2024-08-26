import 'package:common/common.dart';
import 'package:core/feature/project/project.dart';
import 'package:flutter/material.dart';
import 'package:locale/locale.dart';

class ProjectDropdownButton extends StatelessWidget {
  const ProjectDropdownButton({
    super.key,
    this.selected,
    this.onTap,
  });

  final Project? selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: onTap,
      pressedOpacity: 0.4,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            selected?.name ?? LocaleStrings.selectProject,
            style: context.body1,
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.arrow_drop_down,
            color: context.onSurface,
          ),
        ],
      ),
    );
  }
}
