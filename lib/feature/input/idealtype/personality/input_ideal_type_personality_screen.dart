import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/feature/input/core/input_core_flow_radio.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';

class InputIdealTypePersonalityScreen extends StatefulWidget {
  const InputIdealTypePersonalityScreen({
    super.key,
    required this.popBackStack,
    required this.navigateToInputIdealTypeFaceTypeScreen,
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
  ) navigateToInputIdealTypeFaceTypeScreen;

  @override
  State<InputIdealTypePersonalityScreen> createState() =>
      _InputIdealTypePersonalityScreenState();
}

class _InputIdealTypePersonalityScreenState
    extends State<InputIdealTypePersonalityScreen> {
  final args = Get.arguments as Map<String, dynamic>;

  final List<String> _selectItems = [];

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "이상형의 성격은?",
      isEnabled: _selectItems.isNotEmpty,
      onBackPressed: widget.popBackStack,
      onButtonPressed: () {
        widget.navigateToInputIdealTypeFaceTypeScreen(
          args["myInfo"],
          args["messageInterval"],
          args["fashionStyle"],
          args["hasGlasses"],
          args["heightLevel"],
          args["ageType"],
          _selectItems,
        );
      },
      child: Column(
        spacing: 8,
        children: [
          Text(
            "${_selectItems.length}/5",
            style: context.typography.bodyMedium.copyWith(
              color: context.colors.labelAssistive,
            ),
          ),
          Expanded(
            child: InputCoreFlowRadio(
              items: [
                "키 작은",
                "키 보통",
                "키 큰",
                "공부 잘 하는",
                "노래 잘 하는",
                "예체능",
                "밝은",
                "다정한",
                "독특한",
                "자주 만나는",
                "바깥 데이트",
                "집 데이트",
                "활발한",
                "조용한",
                "귀여운",
                "섹시한",
                "안경이 잘 어울리는",
                "잘생긴",
                "애교많은",
                "시크한",
              ],
              selectItems: _selectItems,
              onItemPressed: (item) {
                setState(() {
                  if (_selectItems.contains(item)) {
                    _selectItems.remove(item);
                  } else {
                    if (_selectItems.length >= 5) {
                      return;
                    }
                    _selectItems.add(item);
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
