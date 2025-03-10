import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTextField extends HookWidget {
  final GlobalKey<FormFieldState>? formFieldKey;
  final BoxConstraints? suffixIconConstraints;
  final BoxConstraints? prefixIconConstraints;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? textInputType;
  final Widget? errorWidget;

  final TextStyle? labelStyle;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final bool expands;
  final bool obscureText;
  final int maxLines;
  final int? minLines;
  final bool enabled;
  final bool readOnly;
  final Color? fillColor;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? disabledBorder;
  final InputBorder? focusedErrorBorder;
  final TextAlign textAlign;
  final EdgeInsetsGeometry? contentPadding;

  const CustomTextField({
    this.suffixIconConstraints,
    this.prefixIconConstraints,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.textInputAction,
    this.autovalidateMode,
    this.inputFormatters,
    this.textInputType,
    this.formFieldKey,
    this.initialValue,
    this.validator,
    this.controller,
    this.onChanged,
    this.onSaved,
    this.focusNode,
    this.hintText,
    this.labelText,
    this.suffixIcon,
    this.prefixIcon,
    this.labelStyle,
    this.hintStyle,
    this.maxLines = 1,
    this.minLines,
    this.obscureText = false,
    this.enabled = true,
    this.expands = false,
    this.readOnly = false,
    this.fillColor,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.disabledBorder,
    this.focusedErrorBorder,
    this.textAlign = TextAlign.start,
    this.contentPadding,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = this.focusNode ?? useFocusNode();
    useListenable(focusNode);

    return TextFormField(
      selectionControls: MaterialTextSelectionControls(),
      cursorColor: Theme.of(context).colorScheme.onPrimary,
      cursorErrorColor: Theme.of(context).colorScheme.error,
      key: formFieldKey,
      initialValue: initialValue,
      style: Theme.of(context).textTheme.labelMedium,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      inputFormatters: inputFormatters,
      autovalidateMode: autovalidateMode,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      onSaved: onSaved,
      obscureText: obscureText,
      textInputAction: textInputAction ?? TextInputAction.next,
      validator: validator,
      keyboardType: textInputType,
      maxLines: maxLines,
      minLines: minLines,
      enabled: enabled,
      expands: expands,
      readOnly: readOnly,
      textAlign: textAlign,
      decoration: InputDecoration(
        suffixIconConstraints: suffixIconConstraints,
        prefixIconConstraints: prefixIconConstraints,
        suffixIcon: Padding(
            padding: EdgeInsets.only(right: 30.w, top: 10.h, bottom: 10.h),
            child: suffixIcon),
        prefixIcon: Padding(
            padding: EdgeInsets.only(
                left: 24.w, right: 10.w, top: 19.h, bottom: 19.h),
            child: prefixIcon),
        enabled: enabled,
        contentPadding: contentPadding,
        fillColor: fillColor,
        error: errorWidget,
        hintText: hintText,
        hintStyle: hintStyle,
        labelStyle: labelStyle,
        labelText: labelText,
        border: border,
        enabledBorder: enabledBorder,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,
        disabledBorder: disabledBorder,
      ),
    );
  }
}
