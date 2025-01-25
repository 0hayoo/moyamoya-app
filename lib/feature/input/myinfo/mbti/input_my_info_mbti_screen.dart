import 'package:flutter/cupertino.dart';
import 'package:moyamoya/feature/input/core/input_core_centered_select.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';

class InputMyInfoMBTIScreen extends StatefulWidget {
  const InputMyInfoMBTIScreen({super.key});

  @override
  State<InputMyInfoMBTIScreen> createState() => _InputMyInfoMBTIScreenState();
}

class _InputMyInfoMBTIScreenState extends State<InputMyInfoMBTIScreen> {
  String? _selectedMBTI;

  @override
  Widget build(BuildContext context) {
    return InputCoreScreen(
      title: "나의 MBTI는?",
      isEnabled: _selectedMBTI != null,
      onBackPressed: () {},
      onButtonPressed: () {},
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
        onPressedItem: (item) {
          setState(() {
            _selectedMBTI = item;
          });
        },
      ),
    );
  }
}
