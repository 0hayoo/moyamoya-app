import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/signup/inputphone/sign_up_input_phone_screen.dart';

const signUpInputTelRoute = "/signupinputel";

typedef NavigateToSignUpAuthTel = void Function(String);

GetPage<SignUpInputPhoneScreen> signUpInputPhoneScreen({
  required VoidCallback popBackStack,
  required NavigateToSignUpAuthTel navigateToSignUpAuthTel,
  required VoidCallback navigateToSignIn,
}) =>
    GetPage(
      name: signUpInputTelRoute,
      page: () => SignUpInputPhoneScreen(
        popBackStack: popBackStack,
        navigateToSignUpAuthTel: navigateToSignUpAuthTel,
        navigateToSignIn: navigateToSignIn,
      ),
    );

void navigateToSignUpInputPhoneScreen() => Get.toNamed(signUpInputTelRoute);
