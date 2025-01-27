import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/signup/finalcheck/sign_up_final_check_screen.dart';

const signUpFinalCheckRoute = "/signupfinalcheck";

GetPage<SignUpFinalCheckScreen> signUpFinalCheckScreen({
  required VoidCallback popBackStack,
  required VoidCallback navigateToHome,
}) =>
    GetPage(
      name: signUpFinalCheckRoute,
      page: () => SignUpFinalCheckScreen(
        popBackStack: popBackStack,
        navigateToHome: navigateToHome,
      ),
    );

void navigateToSignUpFinalCheck({
  required String phone,
  required String verifyCode,
  required int schoolId,
  required String schoolName,
  required String schoolType,
  required int schoolGrade,
  required int schoolClass,
  required String name,
  required String profileImageUrl,
  required String gender,
}) =>
    Get.toNamed(
      signUpFinalCheckRoute,
      parameters: {
        "phone": phone,
        "verifyCode": verifyCode,
        "schoolId": schoolId.toString(),
        "schoolName": schoolName,
        "schoolType": schoolType,
        "schoolGrade": schoolGrade.toString(),
        "schoolClass": schoolClass.toString(),
        "name": name,
        "profileImageUrl": profileImageUrl,
        "gender": gender,
      },
    );
