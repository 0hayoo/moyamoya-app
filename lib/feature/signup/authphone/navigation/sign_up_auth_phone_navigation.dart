import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/signup/authphone/sign_up_auth_phone_screen.dart';

const signUpAuthPhoneRoute = "/signupauthtel";

GetPage<SignUpAuthPhoneScreen> signUpAuthPhoneScreen({
  required VoidCallback popBackStack,
}) =>
    GetPage(
      name: signUpAuthPhoneRoute,
      page: () => SignUpAuthPhoneScreen(
        popBackStack: popBackStack,
      ),
    );

void navigateToSignUpAuthPhoneScreen({
  required String tel,
}) =>
    Get.toNamed(
      signUpAuthPhoneRoute,
      parameters: {"tel": tel},
    );
