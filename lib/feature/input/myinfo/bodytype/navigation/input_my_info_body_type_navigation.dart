import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/input/myinfo/bodytype/input_my_info_body_type_screen.dart';

const inputMyInfoBodyTypeRoute = "/inputmyinfobodytype";

GetPage<InputMyInfoBodyTypeScreen> inputMyInfoBodyTypeScreen({
  required VoidCallback popBackStack,
  required Function(
    String messageInterval,
    List<String> fashionStyle,
    bool isGlasses,
    int height,
    String mbti,
    String faceType,
    String bodyType,
  ) navigateToInputMyInfoHairTypeOne,
}) =>
    GetPage(
      name: inputMyInfoBodyTypeRoute,
      page: () => InputMyInfoBodyTypeScreen(
        popBackStack: popBackStack,
        navigationToInputMyInfoHairTypeOne: navigateToInputMyInfoHairTypeOne,
      ),
    );

void navigateToInputMyInfoBodyTypeScreen({
  required String messageInterval,
  required List<String> fashionStyle,
  required bool isGlasses,
  required int height,
  required String mbti,
  required String faceType,
}) =>
    Get.toNamed(
      inputMyInfoBodyTypeRoute,
      arguments: {
        "messageInterval": messageInterval,
        "fashionStyle": fashionStyle,
        "isGlasses": isGlasses,
        "height": height,
        "mbti": mbti,
        "faceType": faceType,
      },
    );
