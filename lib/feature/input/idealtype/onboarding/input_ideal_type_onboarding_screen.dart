import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';

class InputIdealTypeOnboardingScreen extends StatefulWidget {
  const InputIdealTypeOnboardingScreen({
    super.key,
    required this.navigateToInputIdealTypeMessageInterval,
  });

  final Function(UserMyInfo myInfo) navigateToInputIdealTypeMessageInterval;

  @override
  State<InputIdealTypeOnboardingScreen> createState() =>
      _InputIdealTypeOnboardingScreenState();
}

class _InputIdealTypeOnboardingScreenState
    extends State<InputIdealTypeOnboardingScreen> {
  final args = Get.arguments as Map<String, dynamic>;

  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 2),
      () {
        widget.navigateToInputIdealTypeMessageInterval(
          args["myInfo"],
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
