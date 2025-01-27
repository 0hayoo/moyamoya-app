import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/designsystem/component/text_radio.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/domain/model/user_profile_available_personality.dart';
import 'package:moyamoya/feature/input/core/input_core_screen.dart';
import 'package:moyamoya/feature/input/idealtype/personality/viewmodel/input_ideal_type_personality_viewmodel.dart';

class InputIdealTypePersonalityScreen extends StatefulWidget {
  const InputIdealTypePersonalityScreen({
    super.key,
    required this.popBackStack,
    required this.navigateToInputIdealTypeFaceTypeScreen,
  });

  final VoidCallback popBackStack;
  final Function(
    UserMyInfo myInfo,
    String messageInterval,
    List<String> fashionStyle,
    bool hasGlasses,
    String heightLevel,
    String ageType,
    List<UserProfileAvailablePersonality> personality,
  ) navigateToInputIdealTypeFaceTypeScreen;

  @override
  State<InputIdealTypePersonalityScreen> createState() =>
      _InputIdealTypePersonalityScreenState();
}

class _InputIdealTypePersonalityScreenState
    extends State<InputIdealTypePersonalityScreen> {
  final _viewModel = Get.put(InputIdealTypePersonalityViewModel());
  final args = Get.arguments as Map<String, dynamic>;

  final List<UserProfileAvailablePersonality> _selectItems = [];

  @override
  void initState() {
    _viewModel.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InputCoreScreen(
        title: "이상형의 성격은?",
        isEnabled: _selectItems.isNotEmpty,
        onBackPressed: widget.popBackStack,
        onButtonPressed: () {
          widget.navigateToInputIdealTypeFaceTypeScreen(
            args["myInfo"],
            args["messageInterval"],
            args["fashionStyle"],
            args["hasGlasses"],
            args["heightLevel"],
            args["ageType"],
            _selectItems,
          );
        },
        child: Column(
          spacing: 8,
          children: [
            Text(
              "${_selectItems.length}/5",
              style: context.typography.bodyMedium.copyWith(
                color: context.colors.labelAssistive,
              ),
            ),
            Expanded(
              child: _InputCorePersonalityFlowRadio(
                items: _viewModel.availablePersonalities.value,
                selectItems: _selectItems,
                onItemPressed: (item) {
                  setState(() {
                    if (_selectItems.contains(item)) {
                      _selectItems.remove(item);
                    } else {
                      if (_selectItems.length >= 5) {
                        return;
                      }
                      _selectItems.add(item);
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InputCorePersonalityFlowRadio extends StatelessWidget {
  const _InputCorePersonalityFlowRadio({
    super.key,
    required this.items,
    required this.selectItems,
    required this.onItemPressed,
  });

  final List<UserProfileAvailablePersonality> items;
  final List<UserProfileAvailablePersonality> selectItems;
  final Function(UserProfileAvailablePersonality) onItemPressed;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: items
          .map(
            (item) => MoyaMoyaTextRadio(
              text: item.content,
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
