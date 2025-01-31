import 'package:get/get.dart';
import 'package:moyamoya/feature/matching/resulttwo/matching_result_two_screen.dart';

const matchingResultTwoRoute = "/matchingresulttwo";

GetPage<MatchingResultTwoScreen> matchingResultTwoScreen() => GetPage(
      name: matchingResultTwoRoute,
      page: () => MatchingResultTwoScreen(),
    );

void navigateToMatchingResultTwo() => Get.toNamed(matchingResultTwoRoute);
