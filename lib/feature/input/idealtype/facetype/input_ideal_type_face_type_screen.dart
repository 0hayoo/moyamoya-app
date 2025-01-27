import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/domain/model/user_profile_available_personality.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';
import 'package:moyamoya/feature/input/core/input_core_text_radio.dart';

class InputIdealTypeFaceTypeScreen extends StatefulWidget {
  const InputIdealTypeFaceTypeScreen({
    super.key,
    required this.popBackStack,
    required this.navigateToInputIdealTypeBodyTypeScreen,
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
  ) navigateToInputIdealTypeBodyTypeScreen;

  @override
  State<InputIdealTypeFaceTypeScreen> createState() =>
      _InputIdealTypeFaceTypeScreenState();
}

class _InputIdealTypeFaceTypeScreenState
    extends State<InputIdealTypeFaceTypeScreen> {
  final args = Get.arguments as Map<String, dynamic>;

  String? _selectItem;

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "이상형의 얼굴상은?",
      isEnabled: _selectItem != null,
      onBackPressed: widget.popBackStack,
      onButtonPressed: () {
        widget.navigateToInputIdealTypeBodyTypeScreen(
          args["myInfo"],
          args["messageInterval"],
          args["fashionStyle"],
          args["hasGlasses"],
          args["heightLevel"],
          args["ageType"],
          args["personality"],
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
            _selectItem = item == _selectItem ? null : item;
          });
        },
      ),
    );
  }
}
