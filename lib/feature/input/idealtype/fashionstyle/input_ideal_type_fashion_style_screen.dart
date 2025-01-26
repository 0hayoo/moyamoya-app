import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/feature/input/core/input_core_flow_radio.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';

class InputIdealTypeFashionStyleScreen extends StatefulWidget {
  const InputIdealTypeFashionStyleScreen({
    super.key,
    required this.popBackStack,
    required this.navigateToInputIdealTypeFashionGlasses,
  });

  final VoidCallback popBackStack;
  final Function(
          UserMyInfo myInfo, String messageInterval, List<String> fashionStyle)
      navigateToInputIdealTypeFashionGlasses;

  @override
  State<InputIdealTypeFashionStyleScreen> createState() =>
      _InputIdealTypeFashionStyleScreenState();
}

class _InputIdealTypeFashionStyleScreenState
    extends State<InputIdealTypeFashionStyleScreen> {
  final args = Get.arguments as Map<String, dynamic>;
  final List<String> _selectItems = [];

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "이상형의 패션 스타일은?",
      isEnabled: _selectItems.isNotEmpty,
      onBackPressed: widget.popBackStack,
      onButtonPressed: () {
        widget.navigateToInputIdealTypeFashionGlasses(
          args["myInfo"],
          args["messageInterval"],
          _selectItems
              .map(
                (item) => switch (item) {
                  "캐주얼" => "CASUAL",
                  "미니멀" => "MINIMAL",
                  "스트릿" => "STREET",
                  "빈티지" => "VINTAGE",
                  "모던" => "MODERN",
                  "클래식" => "CLASSIC",
                  "스포티" => "SPORTY",
                  _ => "",
                },
              )
              .toList(),
        );
      },
      child: InputCoreFlowRadio(
        items: [
          "캐주얼",
          "미니멀",
          "스트릿",
          "빈티지",
          "모던",
          "클래식",
          "스포티",
        ],
        selectItems: _selectItems,
        onItemPressed: (item) {
          setState(() {
            if (_selectItems.contains(item)) {
              _selectItems.remove(item);
            } else {
              _selectItems.add(item);
            }
          });
        },
      ),
    );
  }
}
