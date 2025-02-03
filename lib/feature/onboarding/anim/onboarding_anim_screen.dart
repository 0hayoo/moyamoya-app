import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:moyamoya/feature/onboarding/anim/viewmodel/onboarding_anim_viewmodel.dart';

class OnboardingAnimScreen extends StatefulWidget {
  const OnboardingAnimScreen({
    super.key,
    required this.navigateToOnboardingOriginScreen,
    required this.navigateToHome,
  });

  final VoidCallback navigateToOnboardingOriginScreen;
  final VoidCallback navigateToHome;

  @override
  State<OnboardingAnimScreen> createState() => _OnboardingAnimScreenState();
}

class _OnboardingAnimScreenState extends State<OnboardingAnimScreen> {
  double _opacity = 0.0;
  final OnboardingAnimViewModel _onboardingAnimViewModel =
      Get.put(OnboardingAnimViewModel());

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    Future.delayed(
      Duration(milliseconds: 1100),
      () async {
        if (await _onboardingAnimViewModel.isLogin()) {
          widget.navigateToHome();
        } else {
          widget.navigateToOnboardingOriginScreen();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.fillAssistive,
      body: Center(
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: Duration(seconds: 1), // 1초 동안 애니메이션
          curve: Curves.easeInOut,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(37.5),
            child: Image.asset(
              "assets/images/AppIcon.png",
              width: 150,
              height: 150,
            ),
          ),
        ),
      ),
    );
  }
}
