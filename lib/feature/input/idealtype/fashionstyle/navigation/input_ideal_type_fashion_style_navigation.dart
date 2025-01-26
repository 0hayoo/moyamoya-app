import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/feature/input/idealtype/fashionstyle/input_ideal_type_fashion_style_screen.dart';

const inputIdealTypeFashionStyleRoute = "/inputidealtypefashionstyle";

GetPage<InputIdealTypeFashionStyleScreen> inputIdealTypeFashionStyleScreen({
  required VoidCallback popBackStack,
  required Function(
          UserMyInfo myInfo, String messageInterval, List<String> fashionStyle)
      navigateToInputIdealTypeFashionGlasses,
}) =>
    GetPage(
      name: inputIdealTypeFashionStyleRoute,
      page: () => InputIdealTypeFashionStyleScreen(
        popBackStack: popBackStack,
        navigateToInputIdealTypeFashionGlasses:
            navigateToInputIdealTypeFashionGlasses,
      ),
    );

void navigateToInputIdealTypeFashionStyleScreen({
  required UserMyInfo myInfo,
  required String messageInterval,
}) =>
    Get.toNamed(
      inputIdealTypeFashionStyleRoute,
      arguments: {
        "myInfo": myInfo,
        "messageInterval": messageInterval,
      },
    );
