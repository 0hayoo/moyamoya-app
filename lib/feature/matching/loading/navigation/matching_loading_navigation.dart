import 'package:get/get.dart';
import 'package:moyamoya/feature/matching/loading/matching_loading_screen.dart';

const matchingLoadingRoute = "/matchingloading";

GetPage<MatchingLoadingScreen> matchingLoadingScreen() => GetPage(
      name: matchingLoadingRoute,
      page: () => MatchingLoadingScreen(),
    );

void navigateToMatchingLoadingScreen() => Get.toNamed(matchingLoadingRoute);
