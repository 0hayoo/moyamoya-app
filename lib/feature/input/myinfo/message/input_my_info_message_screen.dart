import 'package:flutter/material.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';
import 'package:moyamoya/feature/input/core/input_core_text_radio.dart';

class InputMyInfoMessageScreen extends StatefulWidget {
  const InputMyInfoMessageScreen({
    super.key,
  });

  @override
  State<InputMyInfoMessageScreen> createState() =>
      _InputMyInfoMessageScreenState();
}

class _InputMyInfoMessageScreenState extends State<InputMyInfoMessageScreen> {
  String? _selectItem;

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "나의 연락 텀은?",
      isEnabled: _selectItem != null,
      onBackPressed: () {},
      onButtonPressed: () {},
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
