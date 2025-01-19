import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:smooth_corner/smooth_corner.dart';

enum ButtonSize {
  larger,
  large,
  medium,
  small,
}

enum ButtonType {
  primary,
  secondary,
  assistive,
  alternative,
}

class MoyaMoyaButton extends StatefulWidget {
  const MoyaMoyaButton({
    super.key,
    required this.text,
    required this.buttonSize,
    required this.buttonType,
    required this.onPressed,
    this.isEnabled = true,
    this.rounded = false,
  });

  final String text;
  final ButtonSize buttonSize;
  final ButtonType buttonType;
  final VoidCallback onPressed;
  final bool isEnabled;
  final bool rounded;

  @override
  State<MoyaMoyaButton> createState() => _MoyaMoyaButtonState();
}

class _MoyaMoyaButtonState extends State<MoyaMoyaButton> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _getBackgroundColor(context);
    return GestureDetector(
      onTap: widget.isEnabled ? widget.onPressed : () {},
      onTapDown: (_) => _updateScale(0.95), // 누를 때 축소
      onTapCancel: () => _updateScale(1.0), // 취소 시 복원
      onTapUp: (_) => _updateScale(1.0), // 뗄 때 복원
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        child: SizedBox(
          height: _getHeight(),
          child: Container(
            alignment: Alignment.center,
            padding: _getPadding(),
            decoration: ShapeDecoration(
              color: widget.isEnabled
                  ? backgroundColor
                  : backgroundColor.withValues(alpha: 0.4),
              shape: SmoothRectangleBorder(
                borderRadius:
                    widget.rounded ? BorderRadius.circular(99) : _getRadius(),
                smoothness: 0.6,
              ),
              shadows: _getShadow(context),
            ),
            child: Text(
              widget.text,
              style: _getTextStyle(context),
            ),
          ),
        ),
      ),
    );
  }

  void _updateScale(double scale) {
    setState(() {
      _scale = widget.isEnabled ? scale : 1;
    });
  }

  double _getHeight() => switch (widget.buttonSize) {
        ButtonSize.larger => 56.0,
        ButtonSize.large => 48.0,
        ButtonSize.medium => 38.0,
        ButtonSize.small => 32.0,
      };

  Color _getBackgroundColor(BuildContext context) =>
      switch (widget.buttonType) {
        ButtonType.primary => context.colors.primaryNormal,
        ButtonType.secondary => context.colors.primaryAssistive,
        ButtonType.assistive => context.colors.staticWhite,
        ButtonType.alternative => context.colors.fillNormal,
      };

  Color _getTextColor(BuildContext context) => switch (widget.buttonType) {
        ButtonType.primary => context.colors.staticWhite,
        ButtonType.secondary => context.colors.primaryNormal,
        ButtonType.assistive => context.colors.staticBlack,
        ButtonType.alternative => context.colors.labelNeutral,
      };

  EdgeInsets? _getPadding() => switch (widget.buttonSize) {
        ButtonSize.larger =>
          const EdgeInsets.symmetric(horizontal: 24, vertical: 16.5),
        ButtonSize.large =>
          const EdgeInsets.symmetric(horizontal: 20, vertical: 13.5),
        ButtonSize.medium =>
          const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ButtonSize.small =>
          const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      };

  BorderRadius _getRadius() => switch (widget.buttonSize) {
        ButtonSize.larger => BorderRadius.circular(16),
        ButtonSize.large => BorderRadius.circular(14),
        ButtonSize.medium => BorderRadius.circular(12),
        ButtonSize.small => BorderRadius.circular(10),
      };

  List<BoxShadow> _getShadow(BuildContext context) =>
      switch (widget.buttonType) {
        ButtonType.primary => [context.shadow.primary2],
        ButtonType.secondary => [],
        ButtonType.assistive => [],
        ButtonType.alternative => [context.shadow.black1],
      };

  TextStyle _getTextStyle(BuildContext context) => switch (widget.buttonSize) {
        ButtonSize.larger => context.typography.headlineBold
            .copyWith(color: _getTextColor(context)),
        ButtonSize.large =>
          context.typography.bodyBold.copyWith(color: _getTextColor(context)),
        ButtonSize.medium =>
          context.typography.labelBold.copyWith(color: _getTextColor(context)),
        ButtonSize.small => context.typography.captionBold
            .copyWith(color: _getTextColor(context)),
      };
}
