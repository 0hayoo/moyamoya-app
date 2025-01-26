import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moyamoya/feature/input/myinfo/skincolor/input_my_info_skin_color_screen.dart';

const inputMyInfoSkinColorRoute = "/inputmyinfoskincolor";

GetPage<InputMyInfoSkinColorScreen> inputMyInfoSkinColorScreen({
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
    String skinColor,
  ) navigationToInputIdealType,
}) =>
    GetPage(
      name: inputMyInfoSkinColorRoute,
      page: () => InputMyInfoSkinColorScreen(
        popBackStack: popBackStack,
        navigationToInputIdealType: navigationToInputIdealType,
      ),
    );

void navigateToInputMyInfoSkinColorScreen({
  required String messageInterval,
  required List<String> fashionStyle,
  required bool isGlasses,
  required int height,
  required String mbti,
  required String faceType,
  required String bodyType,
  required String hairLength,
  required bool isCurly,
  required bool hasPerm,
  required bool hasBang,
}) {
  Get.toNamed(
    inputMyInfoSkinColorRoute,
    arguments: {
      "messageInterval": messageInterval,
      "fashionStyle": fashionStyle,
      "isGlasses": isGlasses,
      "height": height,
      "mbti": mbti,
      "faceType": faceType,
      "bodyType": bodyType,
      "hairLength": hairLength,
      "isCurly": isCurly,
      "hasPerm": hasPerm,
      "hasBang": hasBang,
    },
  );
}
