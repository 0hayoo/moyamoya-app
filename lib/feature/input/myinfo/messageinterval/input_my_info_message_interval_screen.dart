import 'package:flutter/material.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';
import 'package:moyamoya/feature/input/core/input_core_text_radio.dart';

class InputMyInfoMessageIntervalScreen extends StatefulWidget {
  const InputMyInfoMessageIntervalScreen({
    super.key,
    required this.popBackStack,
    required this.navigationToInputMyInfoFashionStyle,
  });

  final VoidCallback popBackStack;
  final Function(String) navigationToInputMyInfoFashionStyle;

  @override
  State<InputMyInfoMessageIntervalScreen> createState() =>
      _InputMyInfoMessageIntervalScreenState();
}

class _InputMyInfoMessageIntervalScreenState
    extends State<InputMyInfoMessageIntervalScreen> {
  String? _selectItem;

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "나의 연락 텀은?",
      isEnabled: _selectItem != null,
      onBackPressed: widget.popBackStack,
      onButtonPressed: () {
        widget.navigationToInputMyInfoFashionStyle(_selectItem!);
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
