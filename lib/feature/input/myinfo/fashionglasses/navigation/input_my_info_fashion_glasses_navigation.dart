import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/input/myinfo/fashionglasses/input_my_info_fashion_glasses_screen.dart';

const inputMyInfoFashionGlassesRoute = "/inputmyinfofashionglasses";

GetPage<InputMyInfoFashionGlassesScreen> inputMyInfoFashionGlassesScreen({
  required VoidCallback popBackStack,
  required Function(
    String messageInterval,
    List<String> fashionStyle,
    bool isGlasses,
  ) navigationToInputMyInfoHeight,
}) =>
    GetPage(
      name: inputMyInfoFashionGlassesRoute,
      page: () => InputMyInfoFashionGlassesScreen(
        popBackStack: popBackStack,
        navigationToInputMyInfoHeight: navigationToInputMyInfoHeight,
      ),
    );

void navigateToInputMyInfoFashionGlassesScreen({
  required String messageInterval,
  required List<String> fashionStyle,
}) =>
    Get.toNamed(
      inputMyInfoFashionGlassesRoute,
      arguments: {
        "messageInterval": messageInterval,
        "fashionStyle": fashionStyle,
      },
    );
