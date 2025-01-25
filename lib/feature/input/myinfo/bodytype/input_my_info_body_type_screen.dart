import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';
import 'package:moyamoya/feature/input/core/input_core_text_radio.dart';

class InputMyInfoBodyTypeScreen extends StatefulWidget {
  const InputMyInfoBodyTypeScreen({
    super.key,
    required this.popBackStack,
    required this.navigationToInputMyInfoHairType,
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
  ) navigationToInputMyInfoHairType;

  @override
  State<InputMyInfoBodyTypeScreen> createState() =>
      _InputMyInfoBodyTypeScreenState();
}

class _InputMyInfoBodyTypeScreenState extends State<InputMyInfoBodyTypeScreen> {
  final args = Get.arguments as Map<String, dynamic>;
  String? _selectItem;

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "나의 체형은?",
      isEnabled: _selectItem != null,
      onBackPressed: widget.popBackStack,
      onButtonPressed: () {
        widget.navigationToInputMyInfoHairType(
          args["messageInterval"],
          args["fashionStyle"],
          args["isGlasses"],
          args["height"],
          args["mbti"],
          args["faceType"],
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
