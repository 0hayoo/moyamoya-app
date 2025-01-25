import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/button.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({
    super.key,
    required this.navigateToSignUp,
  });

  final VoidCallback navigateToSignUp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primaryNormal,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 16,
                  right: 48,
                  left: 48,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: MoyaMoyaButton(
                    text: "시작하기",
                    buttonSize: ButtonSize.larger,
                    buttonType: ButtonType.assistive,
                    onPressed: navigateToSignUp,
                    rounded: true,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

extension TestExtension on Widget {
  Widget padding() {
    return Padding(
      padding: EdgeInsets.all(30),
      child: this,
    );
  }
}
