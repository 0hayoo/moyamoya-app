import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';
import 'package:moyamoya/feature/input/core/input_core_text_radio.dart';

class InputIdealTypeAgeTypeScreen extends StatefulWidget {
  const InputIdealTypeAgeTypeScreen({
    super.key,
    required this.popBackStack,
    required this.navigateToInputIdealTypePersonalityScreen,
  });

  final VoidCallback popBackStack;
  final Function(
    UserMyInfo myInfo,
    String messageInterval,
    List<String> fashionStyle,
    bool hasGlasses,
    String heightLevel,
    String ageType,
  ) navigateToInputIdealTypePersonalityScreen;

  @override
  State<InputIdealTypeAgeTypeScreen> createState() =>
      _InputIdealTypeAgeTypeScreenState();
}

class _InputIdealTypeAgeTypeScreenState
    extends State<InputIdealTypeAgeTypeScreen> {
  final args = Get.arguments as Map<String, dynamic>;

  String? _selectItem;

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "이상형의 나이는?",
      isEnabled: _selectItem != null,
      onBackPressed: widget.popBackStack,
      onButtonPressed: () {
        widget.navigateToInputIdealTypePersonalityScreen(
          args["myInfo"],
          args["messageInterval"],
          args["fashionStyle"],
          args["hasGlasses"],
          args["heightLevel"],
          switch (_selectItem!) {
            "연하" => "YOUNGER",
            "동갑" => "SAME",
            "연상" => "OLDER",
            _ => "ANY",
          },
        );
      },
      child: InputCoreTextRadio(
        items: [
          "연하",
          "동갑",
          "연상",
          "상관없음",
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
