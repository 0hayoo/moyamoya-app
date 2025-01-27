import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/designsystem/component/text_radio.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/domain/model/user_profile_available_personality.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';

class InputIdealTypeHairTypeTwoScreen extends StatefulWidget {
  const InputIdealTypeHairTypeTwoScreen({
    super.key,
    required this.popBackStack,
    required this.navigateToInputIdealTypeSkinColorScreen,
  });

  final VoidCallback popBackStack;
  final Function(
    UserMyInfo myInfo,
    String messageInterval,
    List<String> fashionStyle,
    bool hasGlasses,
    String heightLevel,
    String ageType,
    List<UserProfileAvailablePersonality> personality,
    String faceType,
    String bodyType,
    String hairLength,
    bool isCurly,
    bool hasPerm,
    bool hasBang,
  ) navigateToInputIdealTypeSkinColorScreen;

  @override
  State<InputIdealTypeHairTypeTwoScreen> createState() =>
      _InputIdealTypeHairTypeTwoScreenState();
}

class _InputIdealTypeHairTypeTwoScreenState
    extends State<InputIdealTypeHairTypeTwoScreen> {
  final args = Get.arguments as Map<String, dynamic>;

  bool? _isCurly;
  bool? _hasPerm;
  bool? _hasBang;

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "이상형의\n헤어스타일은? (2/2)",
      isEnabled: _isCurly != null && _hasPerm != null && _hasBang != null,
      onBackPressed: widget.popBackStack,
      onButtonPressed: () {
        widget.navigateToInputIdealTypeSkinColorScreen(
          args["myInfo"],
          args["messageInterval"],
          args["fashionStyle"],
          args["hasGlasses"],
          args["heightLevel"],
          args["ageType"],
          args["personality"],
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
