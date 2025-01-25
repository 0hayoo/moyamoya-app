import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';
import 'package:moyamoya/feature/input/core/input_core_text_radio.dart';

class InputMyInfoSkinColorScreen extends StatefulWidget {
  const InputMyInfoSkinColorScreen({
    super.key,
    required this.popBackStack,
    required this.navigationToInputIdealType,
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
    String hairType,
    String skinColor,
  ) navigationToInputIdealType;

  @override
  State<InputMyInfoSkinColorScreen> createState() =>
      _InputMyInfoSkinColorScreenState();
}

class _InputMyInfoSkinColorScreenState
    extends State<InputMyInfoSkinColorScreen> {
  final args = Get.arguments as Map<String, dynamic>;
  String? _selectItem;

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "나의 피부톤은?",
      isEnabled: _selectItem != null,
      onBackPressed: widget.popBackStack,
      onButtonPressed: () {
        widget.navigationToInputIdealType(
          args["messageInterval"],
          args["fashionStyle"],
          args["isGlasses"],
          args["height"],
          args["mbti"],
          args["faceType"],
          args["bodyType"],
          args["hairType"],
          _selectItem!,
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
