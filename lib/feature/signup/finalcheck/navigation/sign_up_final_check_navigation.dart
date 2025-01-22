import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/signup/finalcheck/sign_up_final_check_screen.dart';

const signUpFinalCheckRoute = "/signupfinalcheck";

GetPage<SignUpFinalCheckScreen> signUpFinalCheckScreen({
  required VoidCallback popBackStack,
}) =>
    GetPage(
      name: signUpFinalCheckRoute,
      page: () => SignUpFinalCheckScreen(popBackStack: popBackStack),
    );

void navigateToSignUpFinalCheck() => Get.toNamed(signUpFinalCheckRoute);
