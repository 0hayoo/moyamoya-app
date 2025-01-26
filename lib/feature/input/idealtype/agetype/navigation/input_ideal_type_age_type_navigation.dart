import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/feature/input/idealtype/agetype/input_ideal_type_age_type_screen.dart';

const inputIdealTypeAgeTypeRoute = "/inputidealtypeagetype";

GetPage<InputIdealTypeAgeTypeScreen> inputIdealTypeAgeTypeScreen({
  required VoidCallback popBackStack,
  required Function(
    UserMyInfo myInfo,
    String messageInterval,
    List<String> fashionStyle,
    bool hasGlasses,
    String heightLevel,
    String ageType,
  ) navigateToInputIdealTypePersonalityScreen,
}) =>
    GetPage(
      name: inputIdealTypeAgeTypeRoute,
      page: () => InputIdealTypeAgeTypeScreen(
        popBackStack: popBackStack,
        navigateToInputIdealTypePersonalityScreen:
            navigateToInputIdealTypePersonalityScreen,
      ),
    );

void navigateToInputIdealTypeAgeTypeScreen({
  required UserMyInfo myInfo,
  required String messageInterval,
  required List<String> fashionStyle,
  required bool hasGlasses,
  required String heightLevel,
}) =>
    Get.toNamed(
      inputIdealTypeAgeTypeRoute,
      arguments: {
        "myInfo": myInfo,
        "messageInterval": messageInterval,
        "fashionStyle": fashionStyle,
        "hasGlasses": hasGlasses,
        "heightLevel": heightLevel,
      },
    );
