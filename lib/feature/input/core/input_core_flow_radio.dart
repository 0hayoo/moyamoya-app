import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/text_radio.dart';

class InputCoreFlowRadio extends StatelessWidget {
  const InputCoreFlowRadio({
    super.key,
    required this.items,
    required this.selectItems,
    required this.onItemPressed,
  });

  final List<String> items;
  final List<String> selectItems;
  final Function(String) onItemPressed;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: items
          .map(
            (item) => MoyaMoyaTextRadio(
              text: item,
              isChecked: selectItems.contains(item),
              onChanged: (_) {
                onItemPressed(item);
              },
              radioSize: TextRadioSize.small,
            ),
          )
          .toList(),
    );
  }
}
