import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/assets.gen.dart';
import '../utils/input_formatters.dart';
import 'custom_text_field.dart';

class PasswordTextField extends HookWidget {
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final BoxConstraints? prefixIconConstraints;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String?>? onSaved;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final AutovalidateMode? autovalidateMode;
  final bool isDisabled;

  ///Default is lock icon
  final Widget? prefixIcon;
  final String? hintText;
  final String? labelText;
  final bool? obscureText;
  final String? obscuringCharacter;
  final bool? isNewPassword;

  const PasswordTextField({
    this.prefixIconConstraints,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.textInputAction,
    this.textInputType = TextInputType.visiblePassword,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.onChanged,
    this.onSaved,
    this.hintText,
    this.labelText,
    this.obscureText,
    this.obscuringCharacter,
    this.autovalidateMode,
    this.isDisabled = false,
    this.isNewPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    final obscureText = useState(true);
    final focusNode = useFocusNode();
    useListenable(focusNode);

    return CustomTextField(
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      textInputType: textInputType,
      inputFormatters: isNewPassword!
          ? newPasswordInputFormatters()
          : passwordInputFormatters(),
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      onSaved: onSaved,
      obscureText: obscureText.value,
      textInputAction: textInputAction,
      hintText: hintText,
      labelText: labelText,
      validator: validator,
      prefixIcon: prefixIcon,
      prefixIconConstraints: prefixIconConstraints,
      // suffixIconConstraints: BoxConstraints(minHeight: 48.r, minWidth: 48.r),
      suffixIcon: GestureDetector(
        onTap: () => obscureText.value = !obscureText.value,
        child: getSuffixIcon(
          context,
          obscureText: obscureText.value,
          hasFocus: focusNode.hasFocus,
        ),
      ),
      enabled: !isDisabled,
      autovalidateMode: autovalidateMode,
    );
  }

  Widget getSuffixIcon(
    BuildContext context, {
    required bool obscureText,
    required bool hasFocus,
  }) {
    late final SvgGenImage image;

    if (obscureText) {
      image = Assets.icons.hide;
    } else {
      image = Assets.icons.show;
    }

    return image.svg(
      width: 18.w,
      height: 18.h,
      fit: BoxFit.scaleDown,
      colorFilter: ColorFilter.mode(
        Theme.of(context).colorScheme.onPrimary,
        BlendMode.srcIn,
      ),
    );
  }
}
