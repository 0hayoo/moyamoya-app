import 'package:get/get.dart';
import 'package:moyamoya/feature/play/event/play_event_screen.dart';

const playEventRoute = "/playevent";

GetPage<PlayEventScreen> playEventScreen() => GetPage(
      name: playEventRoute,
      page: () => PlayEventScreen(),
    );

void navigateToPlayEventScreen() => Get.toNamed(playEventRoute);