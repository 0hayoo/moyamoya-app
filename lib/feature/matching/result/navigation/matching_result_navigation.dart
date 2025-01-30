import 'package:get/get.dart';
import 'package:moyamoya/feature/matching/result/matching_result_screen.dart';

const matchingResultRoute = "/matchingResult";

GetPage<MatchingResultScreen> matchingResultScreen() => GetPage(
      name: matchingResultRoute,
      page: () => MatchingResultScreen(),
    );

void navigateToMatchingResult() => Get.toNamed(matchingResultRoute);
