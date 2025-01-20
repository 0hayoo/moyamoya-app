import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/signup/inputschool/sign_up_input_school_screen.dart';

const signUpInputSchoolRoute = "/signupinputschool";

GetPage<SignUpInputSchoolScreen> signUpInputSchoolScreen({
  required VoidCallback popBackStack,
}) =>
    GetPage(
      name: signUpInputSchoolRoute,
      page: () => SignUpInputSchoolScreen(
        popBackStack: popBackStack,
      ),
    );

void navigateToSignUpInputSchoolScreen() => Get.toNamed(signUpInputSchoolRoute);
