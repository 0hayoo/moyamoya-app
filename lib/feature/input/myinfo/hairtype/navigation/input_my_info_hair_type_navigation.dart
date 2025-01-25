import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/input/myinfo/hairtype/input_my_info_hair_type_screen.dart';

const inputMyInfoHairTypeRoute = "/inputmyinfohairtype";

GetPage<InputMyInfoSkinColorScreen> inputMyInfoHairTypeScreen({
  required VoidCallback popBackStack,
  required Function(
    String messageInterval,
    List<String> fashionStyle,
    bool isGlasses,
    int height,
    String mbti,
    String faceType,
    String bodyType,
    String hairType,
  ) navigateToInputMyInfoSkinColor,
}) =>
    GetPage(
      name: inputMyInfoHairTypeRoute,
      page: () => InputMyInfoSkinColorScreen(
        popBackStack: popBackStack,
        navigationToInputMyInfoSkinColor: navigateToInputMyInfoSkinColor,
      ),
    );

void navigateToInputMyInfoHairTypeScreen({
  required String messageInterval,
  required List<String> fashionStyle,
  required bool isGlasses,
  required int height,
  required String mbti,
  required String faceType,
  required String bodyType,
}) =>
    Get.toNamed(
      inputMyInfoHairTypeRoute,
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
