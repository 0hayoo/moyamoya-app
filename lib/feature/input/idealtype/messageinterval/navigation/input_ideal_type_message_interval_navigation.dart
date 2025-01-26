import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/feature/input/idealtype/messageinterval/input_ideal_type_message_interval_screen.dart';

const inputIdealTypeMessageIntervalRoute = "/inputidealtypemessageinterval";

GetPage<InputIdealTypeMessageIntervalScreen>
    inputIdealTypeMessageIntervalScreen({
  required VoidCallback popBackStack,
  required Function(UserMyInfo myInfo, String messageInterval)
      navigateToInputIdealTypeFashionStyle,
}) =>
        GetPage(
          name: inputIdealTypeMessageIntervalRoute,
          page: () => InputIdealTypeMessageIntervalScreen(
            popBackStack: popBackStack,
            navigationToInputIdealTypeFashionStyle:
                navigateToInputIdealTypeFashionStyle,
          ),
        );

void navigateToInputIdealTypeMessageIntervalScreen({
  required UserMyInfo myInfo,
}) =>
    Get.offAndToNamed(
      inputIdealTypeMessageIntervalRoute,
      arguments: {
        "myInfo": myInfo,
      },
    );
