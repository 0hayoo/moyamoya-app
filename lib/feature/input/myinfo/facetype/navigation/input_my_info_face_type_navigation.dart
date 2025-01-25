import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/input/myinfo/facetype/input_my_info_face_type_screen.dart';

const inputMyInfoFaceTypeRoute = "/inputmyinfofacetype";

GetPage<InputMyInfoFaceTypeScreen> inputMyInfoFaceTypeScreen({
  required VoidCallback popBackStack,
  required Function(
    String messageInterval,
    List<String> fashionStyle,
    bool isGlasses,
    int height,
    String mbti,
    String faceType,
  ) navigationToInputMyInfoBodyType,
}) =>
    GetPage(
      name: inputMyInfoFaceTypeRoute,
      page: () => InputMyInfoFaceTypeScreen(
        popBackStack: popBackStack,
        navigationToInputMyInfoBodyType: navigationToInputMyInfoBodyType,
      ),
    );

void navigateToInputMyInfoFaceTypeScreen({
  required String messageInterval,
  required List<String> fashionStyle,
  required bool isGlasses,
  required int height,
  required String mbti,
}) =>
    Get.toNamed(
      inputMyInfoFaceTypeRoute,
      arguments: {
        "messageInterval": messageInterval,
        "fashionStyle": fashionStyle,
        "isGlasses": isGlasses,
        "height": height,
        "mbti": mbti,
      },
    );
