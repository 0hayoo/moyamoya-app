import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';
import 'package:moyamoya/feature/input/core/input_core_text_radio.dart';

class InputIdealTypeBodyTypeScreen extends StatefulWidget {
  const InputIdealTypeBodyTypeScreen({
    super.key,
    required this.popBackStack,
    required this.navigateToInputIdealTypeHairTypeOneScreen,
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
  ) navigateToInputIdealTypeHairTypeOneScreen;

  @override
  State<InputIdealTypeBodyTypeScreen> createState() =>
      _InputIdealTypeBodyTypeScreenState();
}

class _InputIdealTypeBodyTypeScreenState
    extends State<InputIdealTypeBodyTypeScreen> {
  final args = Get.arguments as Map<String, dynamic>;

  String? _selectItem;

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "이상형의 체형은?",
      isEnabled: _selectItem != null,
      onBackPressed: widget.popBackStack,
      onButtonPressed: () {
        widget.navigateToInputIdealTypeHairTypeOneScreen(
          args["myInfo"],
          args["messageInterval"],
          args["fashionStyle"],
          args["hasGlasses"],
          args["heightLevel"],
          args["ageType"],
          args["personality"],
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
            _selectItem = item == _selectItem ? null : item;
          });
        },
      ),
    );
  }
}
