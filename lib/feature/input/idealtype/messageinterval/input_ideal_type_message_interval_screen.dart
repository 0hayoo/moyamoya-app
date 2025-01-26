import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';
import 'package:moyamoya/feature/input/core/input_core_text_radio.dart';

class InputIdealTypeMessageIntervalScreen extends StatefulWidget {
  const InputIdealTypeMessageIntervalScreen({
    super.key,
    required this.popBackStack,
    required this.navigationToInputIdealTypeFashionStyle,
  });

  final VoidCallback popBackStack;
  final Function(UserMyInfo, String) navigationToInputIdealTypeFashionStyle;

  @override
  State<InputIdealTypeMessageIntervalScreen> createState() =>
      _InputIdealTypeMessageIntervalScreenState();
}

class _InputIdealTypeMessageIntervalScreenState
    extends State<InputIdealTypeMessageIntervalScreen> {
  final args = Get.arguments as Map<String, dynamic>;

  String? _selectItem;

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "이상형의 연락 텀은?",
      isEnabled: _selectItem != null,
      onBackPressed: widget.popBackStack,
      onButtonPressed: () {
        widget.navigationToInputIdealTypeFashionStyle(
          args["myInfo"],
          switch (_selectItem!) {
            "빠른" => "FAST",
            "적당한" => "NORMAL",
            _ => "LAZY",
          },
        );
      },
      child: InputCoreTextRadio(
        items: [
          "빠른",
          "적당한",
          "늦은",
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
