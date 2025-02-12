import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/point/origin/point_origin_screen.dart';

const pointOriginRoute = "/pointorigin";

GetPage<PointOriginScreen> pointOriginScreen({
  required VoidCallback navigateToHome,
}) =>
    GetPage(
      name: pointOriginRoute,
      page: () => PointOriginScreen(
        navigateToHome: navigateToHome,
      ),
      transition: Transition.noTransition,
    );

void navigateToPointOriginScreen({
  bool popAllPage = false,
  bool useAnimation = true,
}) {
  final transition =
      useAnimation ? Transition.rightToLeft : Transition.noTransition;

  if (popAllPage) {
    Get.offAllNamed(pointOriginRoute);
  } else {
    Get.to(
      pointOriginRoute,
      transition: transition,
    );
  }
}
