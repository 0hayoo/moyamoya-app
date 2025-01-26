import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/feature/input/idealtype/hairtypeone/input_ideal_type_hair_type_one_screen.dart';

const inputIdealTypeHairTypeOneRoute = "/inputidealtypehairtypeone";

GetPage<InputIdealTypeHairTypeOneScreen> inputIdealTypeHairTypeOneScreen({
  required VoidCallback popBackStack,
  required Function(
    UserMyInfo myInfo,
    String messageInterval,
    List<String> fashionStyle,
    bool hasGlasses,
    String heightLevel,
    String ageType,
    List<String> personality,
    String faceType,
    String bodyType,
    String heightLength,
  ) navigateToInputIdealTypeHairTypeTwoScreen,
}) =>
    GetPage(
      name: inputIdealTypeHairTypeOneRoute,
      page: () => InputIdealTypeHairTypeOneScreen(
        popBackStack: popBackStack,
        navigateToInputIdealTypeHairTypeTwoScreen:
            navigateToInputIdealTypeHairTypeTwoScreen,
      ),
    );

void navigateToInputIdealTypeHairTypeOneScreen({
  required UserMyInfo myInfo,
  required String messageInterval,
  required List<String> fashionStyle,
  required bool hasGlasses,
  required String heightLevel,
  required String ageType,
  required List<String> personality,
  required String faceType,
  required String bodyType,
}) =>
    Get.toNamed(
      inputIdealTypeHairTypeOneRoute,
      arguments: {
        "myInfo": myInfo,
        "messageInterval": messageInterval,
        "fashionStyle": fashionStyle,
        "hasGlasses": hasGlasses,
        "heightLevel": heightLevel,
        "ageType": ageType,
        "personality": personality,
        "faceType": faceType,
        "bodyType": bodyType,
      },
    );
