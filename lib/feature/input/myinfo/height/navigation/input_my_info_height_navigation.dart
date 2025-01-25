import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/input/myinfo/height/input_my_info_height_screen.dart';

const inputMyInfoHeightRoute = "/inputmyinfoheight";

GetPage<InputMyInfoHeightScreen> inputMyInfoHeightScreen({
  required VoidCallback popBackStack,
  required Function(
    String messageInterval,
    List<String> fashionStyle,
    bool isGlasses,
    int height,
  ) navigateToInputMyInfoMBTIScreen,
}) =>
    GetPage(
      name: inputMyInfoHeightRoute,
      page: () => InputMyInfoHeightScreen(
        popBackStack: popBackStack,
        navigateToInputMyInfoMBTIScreen: navigateToInputMyInfoMBTIScreen,
      ),
    );

void navigateToInputMyInfoHeightScreen({
  required String messageInterval,
  required List<String> fashionStyle,
  required bool isGlasses,
}) =>
    Get.toNamed(
      inputMyInfoHeightRoute,
      arguments: {
        "messageInterval": messageInterval,
        "fashionStyle": fashionStyle,
        "isGlasses": isGlasses,
      },
    );
