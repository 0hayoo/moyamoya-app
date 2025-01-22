import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/signup/inputprofile/sign_up_input_profile_screen.dart';

const signUpInputProfileRoute = "/signupinputprofileroute";

GetPage<SignUpInputProfileScreen> signUpInputProfileScreen({
  required VoidCallback popBackStack,
}) =>
    GetPage(
      name: signUpInputProfileRoute,
      page: () => SignUpInputProfileScreen(popBackStack: popBackStack),
    );

void navigateToSignUpInputProfileScreen() =>
    Get.toNamed(signUpInputProfileRoute);
