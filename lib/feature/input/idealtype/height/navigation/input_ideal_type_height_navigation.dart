import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/feature/input/idealtype/height/input_ideal_type_height_screen.dart';

const inputIdealTypeHeightRoute = "/inputidealtypeheight";

GetPage<InputIdealTypeHeightScreen> inputIdealTypeHeightScreen({
  required VoidCallback popBackStack,
  required Function(
    UserMyInfo myInfo,
    String messageInterval,
    List<String> fashionStyle,
    bool hasGlasses,
    String heightLevel,
  ) navigateToInputIdealTypeAgeTypeScreen,
}) =>
    GetPage(
      name: inputIdealTypeHeightRoute,
      page: () => InputIdealTypeHeightScreen(
        popBackStack: popBackStack,
        navigateToInputIdealTypeAgeTypeScreen:
            navigateToInputIdealTypeAgeTypeScreen,
      ),
    );

void navigateToInputIdealTypeHeightScreen({
  required UserMyInfo myInfo,
  required String messageInterval,
  required List<String> fashionStyle,
  required bool hasGlasses,
}) =>
    Get.toNamed(
      inputIdealTypeHeightRoute,
      arguments: {
        "myInfo": myInfo,
        "messageInterval": messageInterval,
        "fashionStyle": fashionStyle,
        "hasGlasses": hasGlasses,
      },
    );
