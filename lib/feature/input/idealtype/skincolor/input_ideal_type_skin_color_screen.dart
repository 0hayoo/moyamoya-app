import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/domain/model/user_profile_available_personality.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';
import 'package:moyamoya/feature/input/core/input_core_text_radio.dart';

class InputIdealTypeSkinColorScreen extends StatefulWidget {
  const InputIdealTypeSkinColorScreen({
    super.key,
    required this.popBackStack,
    required this.navigateToInputIdealTypeFinishScreen,
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
    String skinColor,
  ) navigateToInputIdealTypeFinishScreen;

  @override
  State<InputIdealTypeSkinColorScreen> createState() =>
      _InputIdealTypeSkinColorScreenState();
}

class _InputIdealTypeSkinColorScreenState
    extends State<InputIdealTypeSkinColorScreen> {
  final args = Get.arguments as Map<String, dynamic>;
  String? _selectItem;

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "이상형의 피부톤은?",
      isEnabled: _selectItem != null,
      onBackPressed: widget.popBackStack,
      onButtonPressed: () {
        widget.navigateToInputIdealTypeFinishScreen(
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
          args["isCurly"],
          args["hasPerm"],
          args["hasBang"],
          switch (_selectItem!) {
            "밝은" => "BRIGHT",
            "보통" => "NORMAL",
            _ => "DARK",
          },
        );
      },
      child: InputCoreTextRadio(
        items: [
          "밝은",
          "보통",
          "어두운",
        ],
        selectItem: _selectItem,
        onItemPressed: (item) {
          setState(() {
            _selectItem = item;
          });
        },
      ),
    );
  }
}
