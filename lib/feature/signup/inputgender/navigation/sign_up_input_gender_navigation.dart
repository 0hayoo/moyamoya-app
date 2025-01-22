import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/signup/inputgender/sign_up_input_gender_screen.dart';

const signUpInputGenderRoute = "/signupinputgender";

GetPage<SignUpInputGenderScreen> signUpInputGenderScreen({
  required VoidCallback popBackStack,
}) =>
    GetPage(
      name: signUpInputGenderRoute,
      page: () => SignUpInputGenderScreen(popBackStack: popBackStack),
    );

void navigateToSignUpInputGenderScreen() =>
    Get.toNamed(signUpInputGenderRoute);