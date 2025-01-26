import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/feature/input/idealtype/hairtypetwo/input_ideal_type_hair_type_two_screen.dart';

const inputIdealTypeHairTypeTwoRoute = "/inputidealtypehairtypetwo";

GetPage<InputIdealTypeHairTypeTwoScreen> inputIdealTypeHairTypeTwoScreen({
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
    String hairLength,
    bool isCurly,
    bool hasPerm,
    bool hasBang,
  ) navigateToInputIdealTypeSkinColorScreen,
}) =>
    GetPage(
      name: inputIdealTypeHairTypeTwoRoute,
      page: () => InputIdealTypeHairTypeTwoScreen(
        popBackStack: popBackStack,
        navigateToInputIdealTypeSkinColorScreen:
            navigateToInputIdealTypeSkinColorScreen,
      ),
    );

void navigateToInputIdealTypeHairTypeTwoScreen({
  required UserMyInfo myInfo,
  required String messageInterval,
  required List<String> fashionStyle,
  required bool hasGlasses,
  required String heightLevel,
  required String ageType,
  required List<String> personality,
  required String faceType,
  required String bodyType,
  required String hairLength,
}) =>
    Get.toNamed(
      inputIdealTypeHairTypeTwoRoute,
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
        "hairLength": hairLength,
      },
    );
