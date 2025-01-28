import 'package:get/get.dart';
import 'package:moyamoya/feature/home/home_screen.dart';

const homeRoute = "/home";

GetPage<HomeScreen> homeScreen() => GetPage(
      name: homeRoute,
      page: () => HomeScreen(),
    );

void navigateToHome({bool popAllPage = false}) {
  if (popAllPage) {
    Get.offAllNamed(homeRoute);
  } else {
    Get.to(homeRoute);
  }
}
