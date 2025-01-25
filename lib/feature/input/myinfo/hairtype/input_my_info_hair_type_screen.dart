import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';
import 'package:moyamoya/feature/input/core/input_core_text_radio.dart';

class InputMyInfoSkinColorScreen extends StatefulWidget {
  const InputMyInfoSkinColorScreen({
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
    String hairType,
  ) navigationToInputMyInfoSkinColor;

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
      title: "나의 헤어스타일은?",
      isEnabled: _selectItem != null,
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
          _selectItem!,
        );
      },
      child: InputCoreTextRadio(
        items: [
          "마른",
          "보통",
          "통통",
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
