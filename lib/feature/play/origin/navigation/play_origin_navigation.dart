import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/play/origin/play_origin_screen.dart';

const playOriginRoute = "/playorigin";

GetPage<PlayOriginScreen> playOriginScreen({
  required VoidCallback popBackStack,
}) =>
    GetPage(
      name: playOriginRoute,
      page: () => PlayOriginScreen(popBackStack: popBackStack),
    );

void navigateToPlayOriginScreen() => Get.toNamed(playOriginRoute);
