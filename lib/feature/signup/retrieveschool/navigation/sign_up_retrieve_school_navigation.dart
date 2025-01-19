import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/signup/retrieveschool/sign_up_retrieve_school_screen.dart';

const signUpRetrieveSchoolRoute = "/signupretrieveschoolroute";

GetPage<SignUpRetrieveSchoolScreen> signUpRetrieveSchoolScreen({
  required VoidCallback popBackStack,
}) =>
    GetPage(
      name: signUpRetrieveSchoolRoute,
      page: () => SignUpRetrieveSchoolScreen(popBackStack: popBackStack),
    );

void navigateToSignUpRetrieveSchoolScreen() =>
    Get.toNamed(signUpRetrieveSchoolRoute);
