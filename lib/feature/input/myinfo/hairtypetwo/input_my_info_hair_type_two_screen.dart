import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/designsystem/component/text_radio.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';

class InputMyInfoHairTypeTwoScreen extends StatefulWidget {
  const InputMyInfoHairTypeTwoScreen({
    super.key,
    required this.popBackStack,
    required this.navigationToInputMyInfoSkinColor,
  });

  final VoidCallback popBackStack;
  final Function(
    String messageInterval,
    List<String> fashionStyle,
    bool isGlasses,
    int height,
    String mbti,
    String faceType,
    String bodyType,
    String hairLength,
    bool isCurly,
    bool hasPerm,
    bool hasBang,
  ) navigationToInputMyInfoSkinColor;

  @override
  State<InputMyInfoHairTypeTwoScreen> createState() =>
      _InputMyInfoHairTypeTwoScreenState();
}

class _InputMyInfoHairTypeTwoScreenState
    extends State<InputMyInfoHairTypeTwoScreen> {
  final args = Get.arguments as Map<String, dynamic>;

  bool? _isCurly;
  bool? _hasPerm;
  bool? _hasBang;

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "나의 헤어스타일은?\n(2/2)",
      isEnabled: _isCurly != null && _hasPerm != null && _hasBang != null,
      onBackPressed: widget.popBackStack,
      onButtonPressed: () {
        widget.navigationToInputMyInfoSkinColor(
          args["messageInterval"],
          args["fashionStyle"],
          args["isGlasses"],
          args["height"],
          args["mbti"],
          args["faceType"],
          args["bodyType"],
          args["hairLength"],
          _isCurly!,
          _hasPerm!,
          _hasBang!,
        );
      },
      child: Column(
        spacing: 16,
        children: [
          _buildItem(
            title: "생머리 vs 곱슬머리",
            item1: "생머리",
            item2: "곱슬머리",
            firstItemSelected: _isCurly,
            onItemPressed: (isFirstItem) {
              setState(() {
                _isCurly = _isCurly == isFirstItem ? null : isFirstItem;
              });
            },
          ),
          _buildItem(
            title: "펌",
            item1: "펌 함",
            item2: "펌 안 함",
            firstItemSelected: _hasPerm,
            onItemPressed: (isFirstItem) {
              setState(() {
                _hasPerm = _hasPerm == isFirstItem ? null : isFirstItem;
              });
            },
          ),
          _buildItem(
            title: "앞머리",
            item1: "앞머리 있음",
            item2: "앞머리 없음",
            firstItemSelected: _hasBang,
            onItemPressed: (isFirstItem) {
              setState(() {
                _hasBang = _hasBang == isFirstItem ? null : isFirstItem;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required String title,
    required String item1,
    required String item2,
    required bool? firstItemSelected,
    required Function(bool isFirstItem) onItemPressed,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: context.typography.bodyMedium.copyWith(
            color: context.colors.labelAlternative,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: MoyaMoyaTextRadio(
                text: item1,
                isChecked: firstItemSelected ?? false,
                onChanged: (value) {
                  onItemPressed(true);
                },
                radioSize: TextRadioSize.large,
              ),
            ),
            Expanded(
              child: MoyaMoyaTextRadio(
                text: item2,
                isChecked: !(firstItemSelected ?? true),
                onChanged: (value) {
                  onItemPressed(false);
                },
                radioSize: TextRadioSize.large,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
