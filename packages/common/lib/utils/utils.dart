import 'package:common/common.dart';
import 'package:flutter/material.dart';

export 'bloc_helper.dart';
export 'http_client.dart';
export 'sync_command.dart';
export 'to_from_model.dart';

extension ContextUtils on BuildContext {
  BoxConstraints get fullSheetConstraints => BoxConstraints(
        maxHeight: screenSize.height - MediaQuery.paddingOf(this).top,
      );

  RelativeRect getPosition({Offset? offset}) {
    final vOffset = offset ?? Offset.zero;
    final RenderBox widget = findRenderObject()! as RenderBox;
    final RenderBox overlay =
        Navigator.of(this).overlay!.context.findRenderObject()! as RenderBox;
    return RelativeRect.fromRect(
      Rect.fromPoints(
        widget.localToGlobal(vOffset, ancestor: overlay),
        widget.localToGlobal(
          widget.size.bottomRight(Offset.zero) + vOffset,
          ancestor: overlay,
        ),
      ),
      Offset.zero & overlay.size,
    );
  }

  int getTextLines(
    String text, {
    TextStyle? style,
    required double maxWidth,
  }) {
    final span = TextSpan(text: text, style: style);
    final painter = TextPainter(text: span, textDirection: textDirection);
    painter.layout(maxWidth: maxWidth);
    return painter.computeLineMetrics().length;
  }
}

class Formsz {
  const Formsz._();

  static FormzStatus validate({
    bool requiredPure = false,
    required List<FormzInput<dynamic, dynamic>> required,
    List<FormzInput<dynamic, dynamic>> optional = const [],
  }) {
    final requiredStatus = Forms.valid(required);
    final optionalStatus =
        optional.isEmpty ? FormzStatus.pure : Forms.validOrPure(optional);
    final isOptionalDirty = optional.any((input) => input.dirty);
    return requiredStatus.isPure && optionalStatus.isPure
        ? FormzStatus.pure
        : (requiredStatus.isValid || (requiredPure && requiredStatus.isPure)) &&
                (optionalStatus.isValid ||
                    optionalStatus.isPure ||
                    isOptionalDirty)
            ? FormzStatus.valid
            : FormzStatus.invalid;
  }
}

extension ToNullable<T> on T? {
  T? get nullable => this;
}
