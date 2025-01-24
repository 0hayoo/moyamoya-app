import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/signup/retrieveschool/sign_up_retrieve_school_screen.dart';

const signUpRetrieveSchoolRoute = "/signupretrieveschoolroute";

GetPage<SignUpRetrieveSchoolScreen> signUpRetrieveSchoolScreen({
  required VoidCallback popBackStack,
  required Function(
    String phone,
    String verifyCode,
    int schoolId,
    String schoolName,
    String schoolType,
  ) navigateToSignUpInputSchoolInfoScreen,
}) =>
    GetPage(
      name: signUpRetrieveSchoolRoute,
      page: () => SignUpRetrieveSchoolScreen(
        popBackStack: popBackStack,
        navigateToSignUpInputSchoolInfoScreen:
            navigateToSignUpInputSchoolInfoScreen,
      ),
    );

void navigateToSignUpRetrieveSchoolScreen({
  required String phone,
  required String verifyCode,
}) =>
    Get.toNamed(
      signUpRetrieveSchoolRoute,
      parameters: {
        "phone": phone,
        "verifyCode": verifyCode,
      },
    );
