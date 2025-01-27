import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/feature/input/idealtype/finish/viewmodel/input_ideal_type_finish_viewmodel.dart';

class InputIdealTypeFinishScreen extends StatefulWidget {
  const InputIdealTypeFinishScreen({
    super.key,
    required this.navigateToHome,
  });

  final Function() navigateToHome;

  @override
  State<InputIdealTypeFinishScreen> createState() =>
      _InputIdealTypeFinishScreenState();
}

class _InputIdealTypeFinishScreenState
    extends State<InputIdealTypeFinishScreen> {
  final _viewModel = Get.put(InputIdealTypeFinishViewModel());
  final args = Get.arguments as Map<String, dynamic>;

  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 2),
      () {
        widget.navigateToHome();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: context.colors.backgroundNeutral,
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 16,
              children: [
                Text(
                  "💕",
                  style: context.typography.display1Bold.copyWith(
                    color: context.colors.labelNormal,
                    fontSize: 84,
                  ),
                ),
                Text(
                  "정확한 매칭을 위해\n이상형을 알려주세요!",
                  textAlign: TextAlign.center,
                  style: context.typography.title2Bold.copyWith(
                    color: context.colors.labelNormal,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_viewModel.isLoading.value)
          Container(
            width: double.infinity,
            height: double.infinity,
            color: context.colors.staticBlack.withValues(alpha: 0.3),
          ),
      ],
    );
  }
}
