import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/signup/authphone/sign_up_auth_phone_screen.dart';

const signUpAuthPhoneRoute = "/signupauthtel";

GetPage<SignUpAuthPhoneScreen> signUpAuthPhoneScreen({
  required VoidCallback popBackStack,
  required Function(String phone, String authCode)
      navigateToSignUpRetrieveSchoolScreen,
}) =>
    GetPage(
      name: signUpAuthPhoneRoute,
      page: () => SignUpAuthPhoneScreen(
        popBackStack: popBackStack,
        navigateToSignUpRetrieveSchoolScreen:
            navigateToSignUpRetrieveSchoolScreen,
      ),
    );

void navigateToSignUpAuthPhoneScreen({
  required String phone,
}) =>
    Get.toNamed(
      signUpAuthPhoneRoute,
      parameters: {"phone": phone},
    );
