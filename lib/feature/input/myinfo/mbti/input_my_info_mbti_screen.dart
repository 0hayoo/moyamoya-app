import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:moyamoya/feature/input/core/input_core_centered_select.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';

class InputMyInfoMBTIScreen extends StatefulWidget {
  const InputMyInfoMBTIScreen({
    super.key,
    required this.popBackStack,
    required this.navigateToInputMyInfoFaceTypeScreen,
  });

  final VoidCallback popBackStack;
  final Function(
    String messageInterval,
    List<String> fashionStyle,
    bool isGlasses,
    int height,
    String mbti,
  ) navigateToInputMyInfoFaceTypeScreen;

  @override
  State<InputMyInfoMBTIScreen> createState() => _InputMyInfoMBTIScreenState();
}

class _InputMyInfoMBTIScreenState extends State<InputMyInfoMBTIScreen> {
  final args = Get.arguments as Map<String, dynamic>;
  String? _selectedMBTI;

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "나의 MBTI는?",
      isEnabled: _selectedMBTI != null,
      onBackPressed: widget.popBackStack,
      onButtonPressed: () {
        widget.navigateToInputMyInfoFaceTypeScreen(
          args["messageInterval"],
          args["fashionStyle"],
          args["isGlasses"],
          args["height"],
          _selectedMBTI!,
        );
      },
      isExpanded: false,
      child: InputCoreCenteredSelect(
        text: _selectedMBTI ?? "",
        items: [
          "ISTJ",
          "ISTP",
          "ISFJ",
          "ISFP",
          "INTJ",
          "INTJ",
          "INFJ",
          "INFP",
          "ESTJ",
          "ESTP",
          "ESFJ",
          "ESFP",
          "ENTJ",
          "ENTP",
          "ENFJ",
          "ENFP"
        ],
        onItemPressed: (item) {
          setState(() {
            _selectedMBTI = item;
          });
        },
      ),
    );
  }
}
