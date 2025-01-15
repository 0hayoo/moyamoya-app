import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/clickable.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';

class MoyaMoyaRadio extends StatefulWidget {
  const MoyaMoyaRadio({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  final bool isChecked;
  final Function(bool value) onChanged;

  @override
  State<MoyaMoyaRadio> createState() => _MoyaMoyaRadioState();
}

class _MoyaMoyaRadioState extends State<MoyaMoyaRadio> {
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
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            border: widget.isChecked
                ? Border.all(
                    color: context.colors.primaryNormal,
                    width: 5,
                  )
                : Border.all(
                    color: context.colors.lineNormal,
                    width: 2,
                  ),
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
