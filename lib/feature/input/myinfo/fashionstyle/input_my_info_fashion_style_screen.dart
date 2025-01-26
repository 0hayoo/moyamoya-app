import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/feature/input/core/input_core_flow_radio.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';

class InputMyInfoFashionStyleScreen extends StatefulWidget {
  const InputMyInfoFashionStyleScreen({
    super.key,
    required this.popBackStack,
    required this.navigationToInputMyInfoFashionGlasses,
  });

  final VoidCallback popBackStack;
  final Function(String messageInterval, List<String> fashionStyle)
      navigationToInputMyInfoFashionGlasses;

  @override
  State<InputMyInfoFashionStyleScreen> createState() =>
      _InputMyInfoFashionStyleScreenState();
}

class _InputMyInfoFashionStyleScreenState
    extends State<InputMyInfoFashionStyleScreen> {
  final args = Get.arguments as Map<String, dynamic>;
  final List<String> _selectItems = [];

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "나의 패션 스타일은?",
      isEnabled: _selectItems.isNotEmpty,
      onBackPressed: widget.popBackStack,
      onButtonPressed: () {
        widget.navigationToInputMyInfoFashionGlasses(
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
