import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/input/myinfo/mbti/input_my_info_mbti_screen.dart';

const inputMyInfoMBTIRoute = "/inputmyinfombti";

GetPage<InputMyInfoMBTIScreen> inputMyInfoMBTIScreen({
  required VoidCallback popBackStack,
  required Function(
    String messageInterval,
    List<String> fashionStyle,
    bool isGlasses,
    int height,
    String mbti,
  ) navigateToInputMyInfoFaceTypeScreen,
}) =>
    GetPage(
      name: inputMyInfoMBTIRoute,
      page: () => InputMyInfoMBTIScreen(
        popBackStack: popBackStack,
        navigateToInputMyInfoFaceTypeScreen:
            navigateToInputMyInfoFaceTypeScreen,
      ),
    );

void navigateToInputMyInfoMBTIScreen({
  required String messageInterval,
  required List<String> fashionStyle,
  required bool isGlasses,
  required int height,
}) =>
    Get.toNamed(
      inputMyInfoMBTIRoute,
      arguments: {
        "messageInterval": messageInterval,
        "fashionStyle": fashionStyle,
        "isGlasses": isGlasses,
        "height": height,
      },
    );
