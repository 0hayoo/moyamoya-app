import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';
import 'package:moyamoya/feature/input/core/input_core_text_radio.dart';

class InputIdealTypeHeightScreen extends StatefulWidget {
  const InputIdealTypeHeightScreen({
    super.key,
    required this.popBackStack,
    required this.navigateToInputIdealTypeAgeTypeScreen,
  });

  final VoidCallback popBackStack;
  final Function(
    UserMyInfo myInfo,
    String messageInterval,
    List<String> fashionStyle,
    bool hasGlasses,
    String heightLevel,
  ) navigateToInputIdealTypeAgeTypeScreen;

  @override
  State<InputIdealTypeHeightScreen> createState() =>
      _InputIdealTypeHeightScreenState();
}

class _InputIdealTypeHeightScreenState
    extends State<InputIdealTypeHeightScreen> {
  final args = Get.arguments as Map<String, dynamic>;
  String? _selectItem;

  @override
  void initState() {
    print(args["myInfo"]);
    print(args["messageInterval"]);
    print(args["fashionStyle"]);
    print(args["hasGlasses"]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "이상형의 키는?",
      isEnabled: _selectItem != null,
      onBackPressed: widget.popBackStack,
      onButtonPressed: () {
        widget.navigateToInputIdealTypeAgeTypeScreen(
          args["myInfo"],
          args["messageInterval"],
          args["fashionStyle"],
          args["hasGlasses"],
          switch (_selectItem!) {
            "큰" => "LARGE",
            "보통" => "MEDIUM",
            "작은" => "SMALL",
            _ => "ANY",
          },
        );
      },
      isExpanded: false,
      child: InputCoreTextRadio(
        items: ["큰", "보통", "작은", "상관없음"],
        selectItem: _selectItem,
        onItemPressed: (item) {
          setState(() {
            _selectItem = item == _selectItem ? null : _selectItem;
          });
        },
      ),
    );
  }
}
