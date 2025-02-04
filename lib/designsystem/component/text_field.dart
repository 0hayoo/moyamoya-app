import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/clickable.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/designsystem/foundation/moya_moya_icons_icons.dart';
import 'package:smooth_corner/smooth_corner.dart';

class MoyaMoyaTextField extends StatefulWidget {
  const MoyaMoyaTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.obscureText = false,
    this.keyboardType,
    this.maxLength,
    this.onPrefixClick,
    this.onSuffixClick,
  });

  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLength;
  final GestureTapCallback? onPrefixClick;
  final GestureTapCallback? onSuffixClick;

  @override
  State<MoyaMoyaTextField> createState() => _MoyaMoyaTextFieldState();
}

class _MoyaMoyaTextFieldState extends State<MoyaMoyaTextField> {
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            ..._getPrefix(),
            Expanded(
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12.5,
                  ),
                  hintText: widget.hintText,
                  hintStyle: context.typography.headlineMedium.copyWith(
                    color: context.colors.labelNormal.withValues(alpha: 0.3),
                  ),
                ),
                maxLength: widget.maxLength,
                style: context.typography.headlineMedium,
                textAlign: TextAlign.start,
                obscureText: widget.obscureText,
                keyboardType: widget.keyboardType,
              ),
            ),
            ..._getSuffix(),
          ],
        ),
      ),
    );
  }

  List<Widget> _getSuffix() {
    if (widget.onSuffixClick != null) {
      return [
        SizedBox(
          width: 32,
          height: 32,
          child: MoyaMoyaClickable(
            onPressed: widget.onSuffixClick!,
            child: Icon(
              size: 24,
              color: context.colors.labelAlternative.withValues(alpha: 0.5),
              MoyaMoyaIcons.out,
            ),
          ),
        ),
      ];
    }
    return [];
  }

  List<Widget> _getPrefix() {
    if (widget.onPrefixClick != null) {
      return [
        SizedBox(
          width: 32,
          height: 32,
          child: MoyaMoyaClickable(
            onPressed: widget.onPrefixClick!,
            child: Icon(
              size: 24,
              color: context.colors.labelAlternative.withValues(alpha: 0.5),
              MoyaMoyaIcons.magnifyingglass,
            ),
          ),
        ),
      ];
    }
    return [];
  }
}
