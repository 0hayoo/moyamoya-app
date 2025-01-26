import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/feature/input/idealtype/onboarding/input_ideal_type_onboarding_screen.dart';

const inputIdealTypeOnboardingRoute = "/inputidealtypeonboarding";

GetPage<InputIdealTypeOnboardingScreen> inputIdealTypeOnboardingScreen({
  required Function(UserMyInfo myInfo) navigateToInputIdealTypeMessageInterval,
}) =>
    GetPage(
      name: inputIdealTypeOnboardingRoute,
      page: () => InputIdealTypeOnboardingScreen(
        navigateToInputIdealTypeMessageInterval:
            navigateToInputIdealTypeMessageInterval,
      ),
    );

void navigateToInputIdealTypeOnboardingScreen({
  required UserMyInfo myInfo,
}) {
  Get.toNamed(
    inputIdealTypeOnboardingRoute,
    arguments: {
      "myInfo": myInfo,
    },
  );
}
