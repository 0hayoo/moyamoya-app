import 'dart:ui';

import 'package:get/get.dart';
import 'package:moyamoya/feature/play/info/play_info_screen.dart';

const playInfoRoute = "/playinfo";

GetPage<PlayInfoScreen> playInfoScreen({
  required VoidCallback popBackStack,
}) =>
    GetPage(
      name: playInfoRoute,
      page: () => PlayInfoScreen(popBackStack: popBackStack),
    );

void navigateToPlayInfoScreen() => Get.toNamed(playInfoRoute);
