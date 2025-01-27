import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/domain/model/user_profile_available_personality.dart';
import 'package:moyamoya/feature/input/idealtype/facetype/input_ideal_type_face_type_screen.dart';

const inputIdealTypeFaceTypeRoute = "/inputidealtypefacetype";

GetPage<InputIdealTypeFaceTypeScreen> inputIdealTypeFaceTypeScreen({
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
  ) navigateToInputIdealTypeBodyTypeScreen,
}) =>
    GetPage(
      name: inputIdealTypeFaceTypeRoute,
      page: () => InputIdealTypeFaceTypeScreen(
        popBackStack: popBackStack,
        navigateToInputIdealTypeBodyTypeScreen:
            navigateToInputIdealTypeBodyTypeScreen,
      ),
    );

void navigateToInputIdealTypeFaceTypeScreen({
  required UserMyInfo myInfo,
  required String messageInterval,
  required List<String> fashionStyle,
  required bool hasGlasses,
  required String heightLevel,
  required String ageType,
  required List<UserProfileAvailablePersonality> personality,
}) =>
    Get.toNamed(
      inputIdealTypeFaceTypeRoute,
      arguments: {
        "myInfo": myInfo,
        "messageInterval": messageInterval,
        "fashionStyle": fashionStyle,
        "hasGlasses": hasGlasses,
        "heightLevel": heightLevel,
        "ageType": ageType,
        "personality": personality,
      },
    );
