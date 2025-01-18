import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/signup/authtel/sign_up_auth_tel_screen.dart';

const signUpAuthTelRoute = "/signupauthtel";

GetPage<SignUpAuthTelScreen> signUpAuthTelScreen({
  required VoidCallback popBackStack,
}) =>
    GetPage(
      name: signUpAuthTelRoute,
      page: () => SignUpAuthTelScreen(
        popBackStack: popBackStack,
      ),
    );

void navigateToSignUpAuthTelScreen({
  required String tel,
}) =>
    Get.toNamed(
      signUpAuthTelRoute,
      parameters: {"tel": tel},
    );
