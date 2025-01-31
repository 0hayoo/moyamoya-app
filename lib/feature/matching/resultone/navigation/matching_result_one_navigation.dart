import 'package:get/get.dart';
import 'package:moyamoya/feature/matching/resultone/matching_result_one_screen.dart';

const matchingResultOneRoute = "/matchingResult";

GetPage<MatchingResultOneScreen> matchingResultOneScreen() => GetPage(
      name: matchingResultOneRoute,
      page: () => MatchingResultOneScreen(),
    );

void navigateToMatchingResultOne() => Get.toNamed(matchingResultOneRoute);
