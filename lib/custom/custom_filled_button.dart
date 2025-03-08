import 'package:flutter/material.dart';

final class CustomFilledButton extends StatelessWidget {
  final bool enabled;
  final void Function()? onPressed;
  final ButtonStyle? style;

  final Widget child;
  final void Function()? onLongPress;
  final void Function(bool)? onHover;
  final void Function(bool)? onFocusChange;
  final FocusNode? focusNode;
  final bool autofocus;
  final Clip clipBehavior;
  final WidgetStatesController? statesController;

  const CustomFilledButton({
    this.enabled = true,
    required this.onPressed,
    required this.child,
    this.onLongPress,
    this.style,
    this.onHover,
    this.onFocusChange,
    this.focusNode,
    this.statesController,
    this.autofocus = false,
    this.clipBehavior = Clip.none,
  }); //tran

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: enabled ? onPressed : null,
      style: style,
      onLongPress: enabled ? onLongPress : null,
      onHover: enabled ? onHover : null,
      onFocusChange: enabled ? onFocusChange : null,
      focusNode: focusNode,
      autofocus: autofocus,
      clipBehavior: clipBehavior,
      statesController: statesController,
      child: child,
    );
  }
}
