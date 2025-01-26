import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/text_radio.dart';

class InputCoreTextRadio extends StatelessWidget {
  const InputCoreTextRadio({
    super.key,
    required this.items,
    required this.selectItem,
    required this.onItemPressed,
  });

  final List<String> items;
  final String? selectItem;
  final Function(String) onItemPressed;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Column(
          children: [
            MoyaMoyaTextRadio(
              text: item,
              isChecked: item == selectItem,
              onChanged: (_) {
                onItemPressed(item);
              },
              radioSize: TextRadioSize.large,
            ),
            if (index != items.length)
              SizedBox(
                height: 8,
              ),
          ],
        );
      },
    );
  }
}
