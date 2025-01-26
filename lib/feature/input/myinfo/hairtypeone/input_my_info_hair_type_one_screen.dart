import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/feature/input/core/input_core_centered_select.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';

class InputMyInfoHairTypeOneScreen extends StatefulWidget {
  const InputMyInfoHairTypeOneScreen({
    super.key,
    required this.popBackStack,
    required this.navigationToInputMyInfoHairTypeTwo,
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
  ) navigationToInputMyInfoHairTypeTwo;

  @override
  State<InputMyInfoHairTypeOneScreen> createState() =>
      _InputMyInfoHairTypeOneScreenState();
}

class _InputMyInfoHairTypeOneScreenState
    extends State<InputMyInfoHairTypeOneScreen> {
  final args = Get.arguments as Map<String, dynamic>;
  String? _selectItem;

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "나의 헤어스타일은?\n(1/2)",
      isEnabled: _selectItem != null,
      onBackPressed: widget.popBackStack,
      onButtonPressed: () {
        widget.navigationToInputMyInfoHairTypeTwo(
          args["messageInterval"],
          args["fashionStyle"],
          args["isGlasses"],
          args["height"],
          args["mbti"],
          args["faceType"],
          args["bodyType"],
          switch (_selectItem!) {
            "짧은 머리(숏컷)" => "SHORT_CUT",
            "단발" => "SHORT_HAIR",
            "중단발" => "MEDIUM",
            "장발" => "LONG",
            _ => ""
          },
        );
      },
      isExpanded: false,
      child: InputCoreCenteredSelect(
        text: _selectItem ?? "",
        items: [
          "짧은 머리(숏컷)",
          "단발",
          "중단발",
          "장발",
        ],
        onItemPressed: (item) {
          setState(() {
            _selectItem = item;
          });
        },
      ),
    );
  }
}
