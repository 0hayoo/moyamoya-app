import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_hair_style.dart';
import 'package:moyamoya/domain/model/user_ideal_type.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/feature/input/idealtype/skincolor/input_ideal_type_skin_color_screen.dart';

const inputIdealTypeSkinColorRoute = "/inputidealtypeskincolor";

GetPage<InputIdealTypeSkinColorScreen> inputIdealTypeSkinColorScreen({
  required VoidCallback popBackStack,
  required Function(
    UserMyInfo myInfo,
    UserIdealType idealType,
  ) navigateToInputIdealTypeFinishScreen,
}) =>
    GetPage(
      name: inputIdealTypeSkinColorRoute,
      page: () => InputIdealTypeSkinColorScreen(
        popBackStack: popBackStack,
        navigateToInputIdealTypeFinishScreen: (
          myInfo,
          messageInterval,
          fashionStyle,
          hasGlasses,
          heightLevel,
          ageType,
          personality,
          faceType,
          bodyType,
          hairLength,
          isCurly,
          hasPerm,
          hasBang,
          skinColor,
        ) {
          navigateToInputIdealTypeFinishScreen(
            myInfo,
            UserIdealType(
              messageInterval: messageInterval,
              fashionStyle: fashionStyle,
              hasGlasses: hasGlasses,
              heightLevel: heightLevel,
              ageType: ageType,
              personality: personality,
              faceType: faceType,
              bodyType: bodyType,
              hairStyle: UserHairStyle(
                hairLength,
                isCurly,
                hasPerm,
                hasBang,
              ),
              skinColor: skinColor,
            ),
          );
        },
      ),
    );

void navigateToInputIdealTypeSkinColorScreen({
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
  required bool isCurly,
  required bool hasPerm,
  required bool hasBang,
}) =>
    Get.toNamed(
      inputIdealTypeSkinColorRoute,
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
        "isCurly": isCurly,
        "hasPerm": hasPerm,
        "hasBang": hasBang,
      },
    );
