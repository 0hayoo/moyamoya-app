import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/feature/input/idealtype/personality/input_ideal_type_personality_screen.dart';

const inputIdealTypePersonalityRoute = "/inputidealtypepersonality";

GetPage<InputIdealTypePersonalityScreen> inputIdealTypePersonalityScreen({
  required VoidCallback popBackStack,
  required Function(
    UserMyInfo myInfo,
    String messageInterval,
    List<String> fashionStyle,
    bool hasGlasses,
    String heightLevel,
    String ageType,
    List<String> personality,
  ) navigateToInputIdealTypeFaceTypeScreen,
}) =>
    GetPage(
      name: inputIdealTypePersonalityRoute,
      page: () => InputIdealTypePersonalityScreen(
        popBackStack: popBackStack,
        navigateToInputIdealTypeFaceTypeScreen:
            navigateToInputIdealTypeFaceTypeScreen,
      ),
    );

void navigateToInputIdealTypePersonalityScreen({
  required UserMyInfo myInfo,
  required String messageInterval,
  required List<String> fashionStyle,
  required bool hasGlasses,
  required String heightLevel,
  required String ageType,
}) =>
    Get.toNamed(
      inputIdealTypePersonalityRoute,
      arguments: {
        "myInfo": myInfo,
        "messageInterval": messageInterval,
        "fashionStyle": fashionStyle,
        "hasGlasses": hasGlasses,
        "heightLevel": heightLevel,
        "ageType": ageType,
      },
    );
