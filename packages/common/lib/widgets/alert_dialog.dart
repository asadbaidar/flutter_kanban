import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:locale/locale.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    this.title,
    this.message,
    this.dismissible = true,
    this.actions,
  });

  static void show(
    BuildContext context, {
    String? title,
    String? message,
    bool dismissible = true,
    List<Widget>? actions,
  }) =>
      showDialog<void>(
        context: context,
        barrierDismissible: dismissible,
        builder: (context) => CustomAlertDialog(
          title: title,
          message: message,
          dismissible: dismissible,
          actions: actions,
        ),
      );

  final String? title;
  final String? message;
  final bool dismissible;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: dismissible,
      child: AlertDialog(
        actionsPadding: const EdgeInsets.all(24),
        title: title?.mapTo(Text.new),
        content: message?.mapTo(Text.new),
        actions: actions,
      ),
    );
  }
}

class DialogTextAction extends StatelessWidget {
  const DialogTextAction(
    this.text, {
    super.key,
    this.onPressed,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed?.call();
        Navigator.pop(context);
      },
      child: Text(text),
    );
  }
}

class DialogSaveAction extends DialogTextAction {
  DialogSaveAction({
    super.key,
    super.onPressed,
  }) : super(LocaleStrings.save);
}

class DialogDiscardAction extends DialogTextAction {
  DialogDiscardAction({
    super.key,
    super.onPressed,
  }) : super(LocaleStrings.discard);
}

class DialogCancelAction extends DialogTextAction {
  DialogCancelAction({
    super.key,
    super.onPressed,
  }) : super(LocaleStrings.cancel);
}

class DialogNoAction extends DialogTextAction {
  DialogNoAction({
    super.key,
    super.onPressed,
  }) : super(LocaleStrings.no);
}

class DialogYesAction extends DialogTextAction {
  DialogYesAction({
    super.key,
    super.onPressed,
  }) : super(LocaleStrings.yes);
}

class SaveConfirmationDialog extends StatelessWidget {
  const SaveConfirmationDialog({
    this.onSave,
    this.onDiscard,
    super.key,
  });

  final VoidCallback? onSave;
  final VoidCallback? onDiscard;

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      dismissible: false,
      title: LocaleStrings.saveChanges,
      message: LocaleStrings.saveChangesSubtitle,
      actions: [
        DialogDiscardAction(onPressed: onDiscard),
        DialogSaveAction(onPressed: onSave),
      ],
    );
  }
}
