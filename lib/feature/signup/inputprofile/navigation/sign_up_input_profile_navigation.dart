import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/signup/inputprofile/sign_up_input_profile_screen.dart';

const signUpInputProfileRoute = "/signupinputprofileroute";

GetPage<SignUpInputProfileScreen> signUpInputProfileScreen({
  required VoidCallback popBackStack,
  required Function(
    String phone,
    String verifyCode,
    int schoolId,
    String schoolName,
    String schoolType,
    int schoolGrade,
    int schoolClass,
    String name,
    String profileImageUrl,
  ) navigateToSignUpInputGenderScreen,
}) =>
    GetPage(
      name: signUpInputProfileRoute,
      page: () => SignUpInputProfileScreen(
        popBackStack: popBackStack,
        navigateToSignUpInputGenderScreen: navigateToSignUpInputGenderScreen,
      ),
    );

void navigateToSignUpInputProfileScreen({
  required String phone,
  required String verifyCode,
  required int schoolId,
  required String schoolName,
  required String schoolType,
  required int schoolGrade,
  required int schoolClass,
}) =>
    Get.toNamed(
      signUpInputProfileRoute,
      parameters: {
        "phone": phone,
        "verifyCode": verifyCode,
        "schoolId": schoolId.toString(),
        "schoolName": schoolName,
        "schoolType": schoolType,
        "schoolGrade": schoolGrade.toString(),
        "schoolClass": schoolClass.toString(),
      },
    );
