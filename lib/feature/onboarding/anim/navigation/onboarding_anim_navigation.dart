import 'dart:ui';

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:moyamoya/feature/onboarding/anim/onboarding_anim_screen.dart';

const onboardingAnimRoute = "/onboardinganim";

GetPage<OnboardingAnimScreen> onboardingAnimScreen({
  required VoidCallback navigateToOnboardingOriginScreen,
  required VoidCallback navigateToHome,
}) =>
    GetPage(
      name: onboardingAnimRoute,
      page: () => OnboardingAnimScreen(
        navigateToOnboardingOriginScreen: navigateToOnboardingOriginScreen,
        navigateToHome: navigateToHome,
      ),
    );
