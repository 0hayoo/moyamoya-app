import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/input/myinfo/fashionstyle/input_my_info_fashion_style_screen.dart';

const inputMyInfoHeightRoute = "/inputmyinfofashionstyle";

GetPage<InputMyInfoFashionStyleScreen> inputMyInfoFashionStyleScreen({
  required VoidCallback popBackStack,
  required Function(String messageInterval, List<String> fashionStyle)
      navigationToInputMyInfoFashionGlasses,
}) =>
    GetPage(
      name: inputMyInfoHeightRoute,
      page: () => InputMyInfoFashionStyleScreen(
        popBackStack: popBackStack,
        navigationToInputMyInfoFashionGlasses:
            navigationToInputMyInfoFashionGlasses,
      ),
    );

void navigateToInputMyInfoFashionStyleScreen({
  required String messageInterval,
}) =>
    Get.toNamed(
      inputMyInfoHeightRoute,
      arguments: {
        "messageInterval": messageInterval,
      },
    );
