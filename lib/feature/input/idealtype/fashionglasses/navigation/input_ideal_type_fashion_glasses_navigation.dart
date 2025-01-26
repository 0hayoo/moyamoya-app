import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/feature/input/idealtype/fashionglasses/input_ideal_type_fashion_glasses_screen.dart';

const inputIdealTypeFashionGlassesRoute = "/inputidealtypefashionglasses";

GetPage<InputIdealTypeFashionGlassesScreen> inputIdealTypeFashionGlassesScreen({
  required VoidCallback popBackStack,
  required Function(
    UserMyInfo myInfo,
    String messageInterval,
    List<String> fashionStyle,
    bool isGlasses,
  ) navigateToInputMyInfoHeight,
}) =>
    GetPage(
      name: inputIdealTypeFashionGlassesRoute,
      page: () => InputIdealTypeFashionGlassesScreen(
        popBackStack: popBackStack,
        navigateToInputIdealTypeHeight: navigateToInputMyInfoHeight,
      ),
    );

void navigateToInputIdealTypeFashionGlassesScreen({
  required UserMyInfo myInfo,
  required String messageInterval,
  required List<String> fashionStyle,
}) =>
    Get.toNamed(
      inputIdealTypeFashionGlassesRoute,
      arguments: {
        "myInfo": myInfo,
        "messageInterval": messageInterval,
        "fashionStyle": fashionStyle,
      },
    );
