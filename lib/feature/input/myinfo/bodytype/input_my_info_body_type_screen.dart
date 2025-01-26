import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';
import 'package:moyamoya/feature/input/core/input_core_text_radio.dart';

class InputMyInfoBodyTypeScreen extends StatefulWidget {
  const InputMyInfoBodyTypeScreen({
    super.key,
    required this.popBackStack,
    required this.navigationToInputMyInfoHairTypeOne,
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
  ) navigationToInputMyInfoHairTypeOne;

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
        widget.navigationToInputMyInfoHairTypeOne(
          args["messageInterval"],
          args["fashionStyle"],
          args["isGlasses"],
          args["height"],
          args["mbti"],
          args["faceType"],
          switch (_selectItem!) {
            "마른" => "SLIM",
            "보통" => "NORMAL",
            _ => "CHUBBY",
          },
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
