import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/designsystem/feature/signup/inputtel/sign_up_input_tel_screen.dart';

const signUpInputTelRoute = "/signupinputel";

GetPage<SignUpInputTelScreen> signUpInputTelScreen({
  required VoidCallback popBackStack,
  required VoidCallback navigateToSignUpAuthTel,
  required VoidCallback navigateToSignIn,
}) =>
    GetPage(
      name: signUpInputTelRoute,
      page: () => SignUpInputTelScreen(
          popBackStack: popBackStack,
          navigateToSignUpAuthTel: navigateToSignUpAuthTel,
          navigateToSignIn: navigateToSignIn),
    );

void navigateToSignUpInputTelScreen() => Get.toNamed(signUpInputTelRoute);