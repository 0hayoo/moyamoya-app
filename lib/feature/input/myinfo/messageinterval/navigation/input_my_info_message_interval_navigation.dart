import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/input/myinfo/messageinterval/input_my_info_message_interval_screen.dart';

const inputMyInfoMessageIntervalRoute = "/inputmyinfomessageinterval";

GetPage<InputMyInfoMessageIntervalScreen> inputMyInfoMessageIntervalScreen({
  required VoidCallback popBackStack,
  required Function(String messageInterval) navigateToInputMyInfoFashionStyle,
}) =>
    GetPage(
      name: inputMyInfoMessageIntervalRoute,
      page: () => InputMyInfoMessageIntervalScreen(
        popBackStack: popBackStack,
        navigationToInputIdealTypeFashionStyle:
            navigateToInputMyInfoFashionStyle,
      ),
    );

void navigateToInputMyInfoMessageIntervalScreen() =>
    Get.toNamed(inputMyInfoMessageIntervalRoute);
