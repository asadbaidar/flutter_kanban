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
    this.pop = true,
    this.onPressed,
  });

  final String text;
  final bool pop;
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
  }) : super(LocaleStrings.save, pop: false);
}

class DialogDiscardAction extends DialogTextAction {
  DialogDiscardAction({
    super.key,
    super.onPressed,
  }) : super(LocaleStrings.discard);
}

class DialogContinueAction extends DialogTextAction {
  const DialogContinueAction({
    super.key,
    super.onPressed,
  }) : super('Continue');
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
  }) : super(LocaleStrings.yes, pop: false);
}

class ConfirmSaveDialog extends StatelessWidget {
  const ConfirmSaveDialog({
    this.onSave,
    this.onDiscard,
    super.key,
  });

  static void show(
    BuildContext context, {
    VoidCallback? onSave,
    VoidCallback? onDiscard,
  }) =>
      showDialog<void>(
        context: context,
        builder: (_) => ConfirmSaveDialog(
          onSave: onSave,
          onDiscard: onDiscard,
        ),
      );

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

class ConfirmDiscardDialog extends StatelessWidget {
  const ConfirmDiscardDialog({
    this.onContinue,
    this.onDiscard,
    super.key,
  });

  static void show(
    BuildContext context, {
    VoidCallback? onContinue,
    VoidCallback? onDiscard,
  }) =>
      showDialog<void>(
        context: context,
        builder: (_) => ConfirmDiscardDialog(
          onContinue: onContinue,
          onDiscard: onDiscard,
        ),
      );

  final VoidCallback? onContinue;
  final VoidCallback? onDiscard;

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
      dismissible: false,
      title: 'Discard Changes',
      message: 'Are you sure you want to discard your changes?',
      actions: [
        DialogDiscardAction(onPressed: onDiscard),
        DialogContinueAction(onPressed: onContinue),
      ],
    );
  }
}
