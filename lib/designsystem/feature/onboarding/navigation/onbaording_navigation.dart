import 'dart:ui';

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:moyamoya/designsystem/feature/onboarding/onboarding_screen.dart';

const onboardingRoute = "/onboarding";

GetPage<OnboardingScreen> onboardingScreen({
  required VoidCallback navigateToSignUp,
}) =>
    GetPage(
      name: onboardingRoute,
      page: () => OnboardingScreen(
        navigateToSignUp: navigateToSignUp,
      ),
    );
