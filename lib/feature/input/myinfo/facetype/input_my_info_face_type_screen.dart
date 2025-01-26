import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';
import 'package:moyamoya/feature/input/core/input_core_text_radio.dart';

class InputMyInfoFaceTypeScreen extends StatefulWidget {
  const InputMyInfoFaceTypeScreen({
    super.key,
    required this.popBackStack,
    required this.navigationToInputMyInfoBodyType,
  });

  final VoidCallback popBackStack;
  final Function(
    String messageInterval,
    List<String> fashionStyle,
    bool isGlasses,
    int height,
    String mbti,
    String faceType,
  ) navigationToInputMyInfoBodyType;

  @override
  State<InputMyInfoFaceTypeScreen> createState() =>
      _InputMyInfoFaceTypeScreenState();
}

class _InputMyInfoFaceTypeScreenState extends State<InputMyInfoFaceTypeScreen> {
  final args = Get.arguments as Map<String, dynamic>;
  String? _selectItem;

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "나의 얼굴상은?",
      isEnabled: _selectItem != null,
      onBackPressed: widget.popBackStack,
      onButtonPressed: () {
        widget.navigationToInputMyInfoBodyType(
          args["messageInterval"],
          args["fashionStyle"],
          args["isGlasses"],
          args["height"],
          args["mbti"],
          switch (_selectItem!) {
            "고양이상" => "CAT",
            "강아지상" => "DOG",
            "토끼상" => "RABBIT",
            "곰상" => "BEAR",
            "늑대상" => "WOLF",
            _ => "DEAR",
          },
        );
      },
      child: InputCoreTextRadio(
        items: [
          "고양이상",
          "강아지상",
          "토끼상",
          "곰상",
          "늑대상",
          "사슴상",
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
