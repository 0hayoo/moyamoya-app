import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:smooth_corner/smooth_corner.dart';

enum TextButtonSize {
  larger,
  large,
  medium,
  small,
}

class MoyaMoyaTextButton extends StatefulWidget {
  const MoyaMoyaTextButton({
    super.key,
    required this.text,
    required this.buttonSize,
    required this.onPressed,
    this.isEnabled = true,
  });

  final String text;
  final TextButtonSize buttonSize;
  final bool isEnabled;
  final GestureTapCallback onPressed;

  @override
  State<MoyaMoyaTextButton> createState() => _MoyaMoyaTextButtonState();
}

class _MoyaMoyaTextButtonState extends State<MoyaMoyaTextButton> {
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
              borderRadius: _getRadius(),
              smoothness: 0.6,
            ),
          ),
          duration: const Duration(milliseconds: 100),
          child: Padding(
            padding: _getEdgeInsets(),
            child: Text(
              widget.text,
              style: _getTextStyle(context).copyWith(
                color: context.colors.labelNormal
                    .withValues(alpha: widget.isEnabled ? 1 : 0.6),
              ),
            ),
          ),
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

  BorderRadius _getRadius() => switch (widget.buttonSize) {
        TextButtonSize.larger => BorderRadius.circular(14),
        TextButtonSize.large => BorderRadius.circular(14),
        TextButtonSize.medium => BorderRadius.circular(12),
        TextButtonSize.small => BorderRadius.circular(10),
      };

  EdgeInsets _getEdgeInsets() => switch (widget.buttonSize) {
        TextButtonSize.larger =>
          EdgeInsets.symmetric(horizontal: 24, vertical: 17.5),
        TextButtonSize.large =>
          EdgeInsets.symmetric(horizontal: 17.5, vertical: 13.5),
        TextButtonSize.medium =>
          EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        TextButtonSize.small =>
          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      };

  TextStyle _getTextStyle(BuildContext context) => switch (widget.buttonSize) {
        TextButtonSize.larger => context.typography.bodyBold,
        TextButtonSize.large => context.typography.bodyBold,
        TextButtonSize.medium => context.typography.labelBold,
        TextButtonSize.small => context.typography.captionBold,
      };
}
