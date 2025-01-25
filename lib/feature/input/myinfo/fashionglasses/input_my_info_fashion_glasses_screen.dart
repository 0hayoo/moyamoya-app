import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';
import 'package:moyamoya/feature/input/core/input_core_text_radio.dart';

class InputMyInfoFashionGlassesScreen extends StatefulWidget {
  const InputMyInfoFashionGlassesScreen({
    super.key,
    required this.popBackStack,
    required this.navigationToInputMyInfoHeight,
  });

  final VoidCallback popBackStack;
  final Function(
    String messageInterval,
    List<String> fashionStyle,
    bool isGlasses,
  ) navigationToInputMyInfoHeight;

  @override
  State<InputMyInfoFashionGlassesScreen> createState() =>
      _InputMyInfoFashionGlassesScreenState();
}

class _InputMyInfoFashionGlassesScreenState
    extends State<InputMyInfoFashionGlassesScreen> {
  final args = Get.arguments as Map<String, dynamic>;

  String? _selectItem;
  bool? _isGlasses;

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "나는 안경을?",
      isEnabled: _isGlasses != null,
      onBackPressed: widget.popBackStack,
      onButtonPressed: () {
        widget.navigationToInputMyInfoHeight(
          args["messageInterval"],
          args["fashionStyle"],
          _isGlasses!,
        );
      },
      child: InputCoreTextRadio(
        items: ["착용", "미착용"],
        selectItem: _selectItem,
        onItemPressed: (item) {
          setState(() {
            _selectItem = item;
            _isGlasses = item == "착용";
          });
        },
      ),
    );
  }
}
