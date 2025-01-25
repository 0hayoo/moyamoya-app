import 'package:flutter/cupertino.dart';
import 'package:moyamoya/designsystem/component/bottom_sheet.dart';
import 'package:moyamoya/designsystem/component/clickable.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';
import 'package:smooth_corner/smooth_corner.dart';

class InputMyInfoHeightScreen extends StatefulWidget {
  const InputMyInfoHeightScreen({super.key});

  @override
  State<InputMyInfoHeightScreen> createState() =>
      _InputMyInfoHeightScreenState();
}

class _InputMyInfoHeightScreenState extends State<InputMyInfoHeightScreen> {
  int _hundreds = 0;
  int _tens = 0;
  int _units = 0;

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "나의 키는?",
      isEnabled: true,
      onBackPressed: () {},
      onButtonPressed: () {},
      isExpanded: false,
      child: MoyaMoyaClickable(
        onPressed: () {
          showMoyaMoyaBottomSheet(
            context: context,
            builder: _buildBottomSheet,
          );
        },
        borderRadius: BorderRadius.circular(99),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 56,
          ),
          child: Container(
            width: double.infinity,
            height: 56,
            decoration: ShapeDecoration(
              color: context.colors.backgroundNormal,
              shape: SmoothRectangleBorder(
                borderRadius: BorderRadius.circular(99),
                smoothness: 0.6,
              ),
              shadows: [context.shadow.black1],
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    (_hundreds * 100 + _tens * 10 + _units).toString(),
                    style: context.typography.headlineMedium.copyWith(
                      color: context.colors.labelStrong,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet(
    BuildContext context,
    StateSetter setBottomSheetState,
  ) {
    return SizedBox(
      width: double.infinity,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.4, // maxHeight 적용
        ),
        child: Row(
          children: [
            Expanded(
              child: CupertinoPicker(
                scrollController:
                    FixedExtentScrollController(initialItem: _hundreds),
                itemExtent: 50,
                onSelectedItemChanged: (int value) {
                  setState(() {
                    _hundreds = value;
                  });
                },
                children: List<Widget>.generate(
                  3,
                  (int index) => Center(child: Text('$index')),
                ),
              ),
            ),
            Expanded(
              child: CupertinoPicker(
                scrollController:
                    FixedExtentScrollController(initialItem: _tens),
                itemExtent: 50,
                onSelectedItemChanged: (int value) {
                  setState(() {
                    _tens = value;
                  });
                },
                children: List<Widget>.generate(
                  10,
                  (int index) => Center(child: Text('$index')),
                ),
              ),
            ),
            Expanded(
              child: CupertinoPicker(
                scrollController:
                    FixedExtentScrollController(initialItem: _units),
                itemExtent: 50,
                onSelectedItemChanged: (int value) {
                  setState(() {
                    _units = value;
                  });
                },
                children: List<Widget>.generate(
                  10,
                  (int index) => Center(child: Text('$index')),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}