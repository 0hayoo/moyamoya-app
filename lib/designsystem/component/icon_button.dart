import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/clickable.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';

class MoyaMoyaIconButton extends StatelessWidget {
  const MoyaMoyaIconButton(
    this.icon, {
    super.key,
    required this.iconSize,
    required this.color,
    required this.innerPadding,
    this.isEnabled = true,
    required this.onPressed,
  });

  final IconData icon;
  final double iconSize;
  final Color? color;
  final EdgeInsets innerPadding;
  final bool isEnabled;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MoyaMoyaClickable(
      onPressed: onPressed,
      isEnabled: isEnabled,
      child: Padding(
        padding: innerPadding,
        child: Icon(
          icon,
          size: iconSize,
          color: color ?? context.colors.labelAssistive,
        ),
      ),
    );
  }
  //
  // MoyaMoyaClickable(
  // onPressed: widget.onPressed,
  // isEnabled: widget.isEnabled,
  // child: Padding(
  // padding: widget.innerPadding,
  // child: Icon(
  // widget.icon,
  // size: widget.iconSize,
  // color: widget.color ?? context.colors.labelAssistive,
  // ),
  // ),
  // );
}
