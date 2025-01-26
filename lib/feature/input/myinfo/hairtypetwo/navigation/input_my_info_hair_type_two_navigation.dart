import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/input/myinfo/hairtypeone/input_my_info_hair_type_one_screen.dart';
import 'package:moyamoya/feature/input/myinfo/hairtypetwo/input_my_info_hair_type_two_screen.dart';

const inputMyInfoHairTypeOneRoute = "/inputmyinfohairtypetwo";

GetPage<InputMyInfoHairTypeOneScreen> inputMyInfoHairTypeTwoScreen({
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
    bool isCurly,
    bool hasPerm,
    bool hasBang,
  ) navigationToInputMyInfoSkinColor,
}) =>
    GetPage(
      name: inputMyInfoHairTypeOneRoute,
      page: () => InputMyInfoHairTypeTwoScreen(
        popBackStack: popBackStack,
        navigationToInputMyInfoSkinColor: navigationToInputMyInfoSkinColor,
      ),
    );

void navigateToInputMyInfoHairTypeTwoScreen({
  required String messageInterval,
  required List<String> fashionStyle,
  required bool isGlasses,
  required int height,
  required String mbti,
  required String faceType,
  required String bodyType,
  required String hairLength,
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
        "hairLength": hairLength,
      },
    );
