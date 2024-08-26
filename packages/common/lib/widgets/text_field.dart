import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.initialValue,
    this.controller,
    this.labelText,
    this.hintText,
    this.textStyle,
    this.hintStyle,
    this.autocorrect = true,
    this.enabled,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLines,
    this.minLines,
    this.textInputAction,
    this.keyboardType = TextInputType.text,
    this.inputFormatters = const [],
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.margin,
    this.validator,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.isDense = true,
  });

  final String? initialValue;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final bool autocorrect;
  final bool? enabled;
  final bool readOnly;
  final bool autofocus;
  final int? maxLines;
  final int? minLines;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final bool isDense;

  int? get _maxLines =>
      (maxLines ?? 0) <= (minLines ?? 0) ? minLines : maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: _buildTextField(context),
    );
  }

  Widget _buildTextField(BuildContext context) {
    final enabled = this.enabled ?? true;
    final style = textStyle ?? context.body2;
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      style: style?.withColor(enabled ? null : context.subtitle),
      textInputAction: textInputAction,
      autocorrect: autocorrect,
      enabled: enabled,
      readOnly: readOnly,
      maxLines: _maxLines,
      minLines: minLines,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      initialValue: initialValue,
      autofocus: autofocus,
      onTap: onTap,
      validator: validator,
      decoration: InputDecoration(
        isDense: isDense,
        errorStyle: context.body3?.error(context),
        hintText: hintText,
        hintStyle: hintStyle ?? style?.onSurfaceVariant(context),
        filled: false,
        contentPadding: padding,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
    );
  }
}
