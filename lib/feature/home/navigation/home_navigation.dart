import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/home/home_screen.dart';

const homeRoute = "/home";

GetPage<HomeScreen> homeScreen({
  required VoidCallback navigateToPoint,
}) =>
    GetPage(
      name: homeRoute,
      page: () => HomeScreen(
        navigateToPoint: navigateToPoint,
      ),
      transition: Transition.noTransition,
    );

void navigateToHome({bool popAllPage = false, bool useAnimation = true}) {
  final transition =
      useAnimation ? Transition.rightToLeft : Transition.noTransition;

  if (popAllPage) {
    Get.offAllNamed(homeRoute);
  } else {
    Get.to(
      homeRoute,
      transition: transition,
    );
  }
}
