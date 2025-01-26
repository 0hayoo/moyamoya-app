import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';
import 'package:moyamoya/feature/input/core/input_core_text_radio.dart';

class InputIdealTypeFashionGlassesScreen extends StatefulWidget {
  const InputIdealTypeFashionGlassesScreen({
    super.key,
    required this.popBackStack,
    required this.navigateToInputIdealTypeHeight,
  });

  final VoidCallback popBackStack;
  final Function(
    UserMyInfo myInfo,
    String messageInterval,
    List<String> fashionStyle,
    bool hasGlasses,
  ) navigateToInputIdealTypeHeight;

  @override
  State<InputIdealTypeFashionGlassesScreen> createState() =>
      _InputIdealTypeFashionGlassesScreenState();
}

class _InputIdealTypeFashionGlassesScreenState
    extends State<InputIdealTypeFashionGlassesScreen> {
  final args = Get.arguments as Map<String, dynamic>;

  String? _selectItem;
  bool? _hasGlasses;

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "이상형은 안경을?",
      isEnabled: _hasGlasses != null,
      onBackPressed: widget.popBackStack,
      onButtonPressed: () {
        widget.navigateToInputIdealTypeHeight(
          args["myInfo"],
          args["messageInterval"],
          args["fashionStyle"],
          _hasGlasses!,
        );
      },
      child: InputCoreTextRadio(
        items: ["착용", "미착용"],
        selectItem: _selectItem,
        onItemPressed: (item) {
          setState(() {
            _selectItem = item;
            _hasGlasses = item == "착용";
          });
        },
      ),
    );
  }
}
