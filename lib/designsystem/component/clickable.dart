import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:smooth_corner/smooth_corner.dart';

class MoyaMoyaClickable extends StatefulWidget {
  const MoyaMoyaClickable({
    super.key,
    required this.child,
    required this.onPressed,
    this.isEnabled = true,
    this.borderRadius,
  });

  final Widget child;
  final bool isEnabled;
  final GestureTapCallback onPressed;
  final BorderRadiusGeometry? borderRadius;

  @override
  State<MoyaMoyaClickable> createState() => _ClickableState();
}

class _ClickableState extends State<MoyaMoyaClickable> {
  double _scale = 1.0;
  bool _isTab = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isEnabled ? widget.onPressed : () {},
      onTapDown: (_) => _onTapDown(), // 누를 때 축소
      onTapCancel: () => _onTapUp(), // 취소 시 복원
      onTapUp: (_) => _onTapUp(), // 뗄 때 복원
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: AnimatedContainer(
          decoration: ShapeDecoration(
            color: _isTab ? context.colors.statusHovered : Colors.transparent,
            shape: SmoothRectangleBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(12),
              smoothness: 0.6,
            ),
          ),
          duration: const Duration(milliseconds: 100),
          child: widget.child,
        ),
      ),
    );
  }

  void _onTapDown() {
    setState(() {
      if (!widget.isEnabled) {
        return _onTapUp();
      }
      _scale = 0.95;
      _isTab = true;
    });
  }

  void _onTapUp() {
    setState(() {
      _scale = 1;
      _isTab = false;
    });
  }
}
