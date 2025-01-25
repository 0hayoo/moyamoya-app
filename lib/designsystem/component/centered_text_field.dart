import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:smooth_corner/smooth_corner.dart';

class MoyaMoyaCenteredTextField extends StatefulWidget {
  const MoyaMoyaCenteredTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
  });

  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  State<MoyaMoyaCenteredTextField> createState() =>
      _MoyaMoyaCenteredTextFieldState();
}

class _MoyaMoyaCenteredTextFieldState extends State<MoyaMoyaCenteredTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: ShapeDecoration(
        color: context.colors.backgroundNormal,
        shape: SmoothRectangleBorder(
          borderRadius: BorderRadius.circular(99),
          smoothness: 0.6,
        ),
        shadows: [context.shadow.black1],
      ),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: 12.5,
            horizontal: 24,
          ),
          hintText: widget.hintText,
          hintStyle: context.typography.headlineMedium.copyWith(
              color: context.colors.labelNormal.withValues(alpha: 0.3)),
        ),
        style: context.typography.headlineMedium,
        textAlign: TextAlign.center,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
      ),
    );
  }
}
