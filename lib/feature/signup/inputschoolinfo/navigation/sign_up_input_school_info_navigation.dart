import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/signup/inputschoolinfo/sign_up_input_school_info_screen.dart';

const signUpInputSchoolRoute = "/signupinputschoolinfo";

GetPage<SignUpInputSchoolInfoScreen> signUpInputSchoolInfoScreen({
  required VoidCallback popBackStack,
  required Function(
    String phone,
    String verifyCode,
    int schoolId,
    String schoolName,
    String schoolType,
    int schoolGrade,
    int schoolClass,
  ) navigateToSignUpInputProfileScreen,
}) =>
    GetPage(
      name: signUpInputSchoolRoute,
      page: () => SignUpInputSchoolInfoScreen(
        popBackStack: popBackStack,
        navigateToSignUpInputProfileScreen: navigateToSignUpInputProfileScreen,
      ),
    );

void navigateToSignUpInputSchoolInfoScreen({
  required String phone,
  required String verifyCode,
  required int schoolId,
  required String schoolName,
  required String schoolType,
}) =>
    Get.toNamed(
      signUpInputSchoolRoute,
      parameters: {
        "phone": phone,
        "verifyCode": verifyCode,
        "schoolId": schoolId.toString(),
        "schoolName": schoolName,
        "schoolType": schoolType
      },
    );
