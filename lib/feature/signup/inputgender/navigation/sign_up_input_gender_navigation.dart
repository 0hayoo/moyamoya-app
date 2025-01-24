import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/signup/inputgender/sign_up_input_gender_screen.dart';

const signUpInputGenderRoute = "/signupinputgender";

GetPage<SignUpInputGenderScreen> signUpInputGenderScreen({
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
    String gender,
  ) navigateToSignUpFinalCheckScreen,
}) =>
    GetPage(
      name: signUpInputGenderRoute,
      page: () => SignUpInputGenderScreen(
        popBackStack: popBackStack,
        navigateToSignUpFinalCheckScreen: navigateToSignUpFinalCheckScreen,
      ),
    );

void navigateToSignUpInputGenderScreen({
  required String phone,
  required String verifyCode,
  required int schoolId,
  required String schoolName,
  required String schoolType,
  required int schoolGrade,
  required int schoolClass,
  required String name,
  required String profileImageUrl,
}) =>
    Get.toNamed(signUpInputGenderRoute, parameters: {
      "phone": phone,
      "verifyCode": verifyCode,
      "schoolId": schoolId.toString(),
      "schoolName": schoolName,
      "schoolType": schoolType,
      "schoolGrade": schoolGrade.toString(),
      "schoolClass": schoolClass.toString(),
      "name": name,
      "profileImageUrl": profileImageUrl,
    });
