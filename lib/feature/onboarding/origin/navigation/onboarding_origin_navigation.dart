import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/onboarding/origin/onboarding_origin_screen.dart';

const onboardingOriginRoute = "/onboardingorigin";

GetPage<OnboardingOriginScreen> onboardingOriginScreen({
  required VoidCallback navigateToSignUp,
}) =>
    GetPage(
      name: onboardingOriginRoute,
      page: () => OnboardingOriginScreen(
        navigateToSignUp: navigateToSignUp,
      ),
    );

void navigateToOnBoardingOriginScreen() =>
    Get.offAllNamed(onboardingOriginRoute);
