import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/input/myinfo/hairtypeone/input_my_info_hair_type_one_screen.dart';

const inputMyInfoHairTypeOneRoute = "/inputmyinfohairtypeone";

GetPage<InputMyInfoHairTypeOneScreen> inputMyInfoHairTypeOneScreen({
  required VoidCallback popBackStack,
  required Function(
    String messageInterval,
    List<String> fashionStyle,
    bool isGlasses,
    int height,
    String mbti,
    String faceType,
    String bodyType,
    String hairLength,
  ) navigateToInputMyInfoHairTypeTwo,
}) =>
    GetPage(
      name: inputMyInfoHairTypeOneRoute,
      page: () => InputMyInfoHairTypeOneScreen(
        popBackStack: popBackStack,
        navigationToInputMyInfoHairTypeTwo: navigateToInputMyInfoHairTypeTwo,
      ),
    );

void navigateToInputMyInfoHairTypeOneScreen({
  required String messageInterval,
  required List<String> fashionStyle,
  required bool isGlasses,
  required int height,
  required String mbti,
  required String faceType,
  required String bodyType,
}) =>
    Get.toNamed(
      inputMyInfoHairTypeOneRoute,
      arguments: {
        "messageInterval": messageInterval,
        "fashionStyle": fashionStyle,
        "isGlasses": isGlasses,
        "height": height,
        "mbti": mbti,
        "faceType": faceType,
        "bodyType": bodyType,
      },
    );
