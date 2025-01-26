import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/feature/input/core/input_core_centered_select.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';

class InputIdealTypeHairTypeOneScreen extends StatefulWidget {
  const InputIdealTypeHairTypeOneScreen({
    super.key,
    required this.popBackStack,
    required this.navigateToInputIdealTypeHairTypeTwoScreen,
  });

  final VoidCallback popBackStack;
  final Function(
    UserMyInfo myInfo,
    String messageInterval,
    List<String> fashionStyle,
    bool hasGlasses,
    String heightLevel,
    String ageType,
    List<String> personality,
    String faceType,
    String bodyType,
    String hairLength,
  ) navigateToInputIdealTypeHairTypeTwoScreen;

  @override
  State<InputIdealTypeHairTypeOneScreen> createState() =>
      _InputIdealTypeHairTypeOneScreenState();
}

class _InputIdealTypeHairTypeOneScreenState
    extends State<InputIdealTypeHairTypeOneScreen> {
  final args = Get.arguments as Map<String, dynamic>;

  String? _selectItem;

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "이상형의 헤어스타일은?\n(1/2)",
      isEnabled: _selectItem != null,
      onBackPressed: widget.popBackStack,
      onButtonPressed: () {
        widget.navigateToInputIdealTypeHairTypeTwoScreen(
          args["myInfo"],
          args["messageInterval"],
          args["fashionStyle"],
          args["hasGlasses"],
          args["heightLevel"],
          args["ageType"],
          args["personality"],
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
