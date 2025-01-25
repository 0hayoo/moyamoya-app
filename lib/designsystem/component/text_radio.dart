import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/clickable.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';

import '../foundation/moya_moya_icons_icons.dart';

enum TextRadioSize {
  small,
  large,
}

class MoyaMoyaTextRadio extends StatefulWidget {
  const MoyaMoyaTextRadio({
    super.key,
    required this.text,
    required this.isChecked,
    required this.onChanged,
    required this.radioSize,
  });

  final String text;
  final bool isChecked;
  final Function(bool value) onChanged;
  final TextRadioSize radioSize;

  @override
  State<MoyaMoyaTextRadio> createState() => _MoyaMoyaTextRadioState();
}

class _MoyaMoyaTextRadioState extends State<MoyaMoyaTextRadio> {
  @override
  Widget build(BuildContext context) {
    return MoyaMoyaClickable(
      onPressed: () {
        widget.onChanged(!widget.isChecked);
      },
      borderRadius: BorderRadius.circular(99),
      child: widget.radioSize == TextRadioSize.small
          ? _getSmallRadio()
          : _getLargeRadio(),
    );
  }

  Widget _getLargeRadio() {
    return Container(
      height: 53,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        border: widget.isChecked
            ? Border.all(
                color: context.colors.primaryNormal,
                width: 2,
                strokeAlign: BorderSide.strokeAlignOutside,
              )
            : Border.all(
                color: context.colors.lineNeutral,
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              widget.text,
              style: widget.isChecked
                  ? context.typography.bodyBold
                      .copyWith(color: context.colors.primaryNormal)
                  : context.typography.bodyMedium
                      .copyWith(color: context.colors.labelAlternative),
            ),
          ),
          ..._getLeftLine()
        ],
      ),
    );
  }

  List<Widget> _getLeftLine() {
    if (widget.isChecked && widget.radioSize == TextRadioSize.large) {
      return [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 24),
            child: Icon(
              MoyaMoyaIcons.lefticon,
              size: 16,
              color: context.colors.primaryNormal,
            ),
          ),
        )
      ];
    }
    return [];
  }

  Widget _getSmallRadio() {
    return Container(
      height: 33,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        border: widget.isChecked
            ? null
            : Border.all(
                color: context.colors.lineNeutral,
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
        color: widget.isChecked
            ? context.colors.primaryNormal
            : Colors.transparent,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 6,
        ),
        child: Text(
          widget.text,
          style: widget.isChecked
              ? context.typography.bodyBold
                  .copyWith(color: context.colors.staticWhite)
              : context.typography.bodyMedium
                  .copyWith(color: context.colors.labelAlternative),
        ),
      ),
    );
  }
}
