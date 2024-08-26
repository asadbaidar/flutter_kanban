import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:locale/locale.dart';

class TaskActionPopup extends StatelessWidget {
  const TaskActionPopup({
    super.key,
    required this.action,
    this.onAction,
  });

  final String action;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      message: Text('Do you want to ${action.toLowerCase()} this task'),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            onAction?.call();
            context.pop();
          },
          child: Text(action),
        ),
        CupertinoActionSheetAction(
          onPressed: context.pop,
          child: Text(LocaleStrings.cancel),
        ),
      ],
    );
  }
}
