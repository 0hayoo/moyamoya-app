import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/domain/model/user_profile_available_personality.dart';
import 'package:moyamoya/feature/input/idealtype/bodytype/input_ideal_type_body_type_screen.dart';

const inputIdealTypeBodyTypeRoute = "/inputidealtypebodytype";

GetPage<InputIdealTypeBodyTypeScreen> inputIdealTypeBodyTypeScreen({
  required VoidCallback popBackStack,
  required Function(
    UserMyInfo myInfo,
    String messageInterval,
    List<String> fashionStyle,
    bool hasGlasses,
    String heightLevel,
    String ageType,
    List<UserProfileAvailablePersonality> personality,
    String faceType,
    String bodyType,
  ) navigateToInputIdealTypeHairTypeOneScreen,
}) =>
    GetPage(
      name: inputIdealTypeBodyTypeRoute,
      page: () => InputIdealTypeBodyTypeScreen(
        popBackStack: popBackStack,
        navigateToInputIdealTypeHairTypeOneScreen:
            navigateToInputIdealTypeHairTypeOneScreen,
      ),
    );

void navigateToInputIdealTypeBodyTypeScreen({
  required UserMyInfo myInfo,
  required String messageInterval,
  required List<String> fashionStyle,
  required bool hasGlasses,
  required String heightLevel,
  required String ageType,
  required List<UserProfileAvailablePersonality> personality,
  required String faceType,
}) =>
    Get.toNamed(
      inputIdealTypeBodyTypeRoute,
      arguments: {
        "myInfo": myInfo,
        "messageInterval": messageInterval,
        "fashionStyle": fashionStyle,
        "hasGlasses": hasGlasses,
        "heightLevel": heightLevel,
        "ageType": ageType,
        "personality": personality,
        "faceType": faceType,
      },
    );
