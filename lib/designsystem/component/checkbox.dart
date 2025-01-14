import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/clickable.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:smooth_corner/smooth_corner.dart';

import '../foundation/moya_moya_icons_icons.dart';

class MoyaMoyaCheckbox extends StatefulWidget {
  const MoyaMoyaCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  final bool isChecked;
  final Function(bool value) onChanged;

  @override
  State<MoyaMoyaCheckbox> createState() => _MoyaMoyaCheckboxState();
}

class _MoyaMoyaCheckboxState extends State<MoyaMoyaCheckbox> {
  @override
  Widget build(BuildContext context) {
    return MoyaMoyaClickable(
      onPressed: () {
        widget.onChanged(!widget.isChecked);
      },
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: EdgeInsets.all(3),
        child: Container(
          width: 18,
          height: 18,
          decoration: ShapeDecoration(
            shape: SmoothRectangleBorder(
              smoothness: 0.6,
              borderRadius: BorderRadius.circular(4),
              side: widget.isChecked
                  ? BorderSide.none
                  : BorderSide(
                      color: context.colors.lineNormal,
                      width: 2,
                    ),
            ),
            color: widget.isChecked
                ? context.colors.primaryNormal
                : Colors.transparent,
          ),
          alignment: Alignment.center,
          child: Icon(
            MoyaMoyaIcons.checkline,
            color: widget.isChecked
                ? context.colors.staticWhite
                : Colors.transparent,
            size: 14,
          ),
        ),
      ),
    );
  }
}
