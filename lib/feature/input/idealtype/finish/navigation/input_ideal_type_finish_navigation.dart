import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_ideal_type.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/feature/input/idealtype/finish/input_ideal_type_finish_screen.dart';

const inputIdealTypeFinishRoute = "/inputidealtypefinish";

GetPage<InputIdealTypeFinishScreen> inputIdealTypeFinishScreen({
  required Function() navigateToHome,
}) =>
    GetPage(
      name: inputIdealTypeFinishRoute,
      page: () => InputIdealTypeFinishScreen(
        navigateToHome: navigateToHome,
      ),
    );

void navigateToInputIdealTypeFinishScreen({
  required UserMyInfo myInfo,
  required UserIdealType idealType,
}) {
  Get.toNamed(
    inputIdealTypeFinishRoute,
    arguments: {
      "myInfo": myInfo,
      "idealType": idealType,
    },
  );
}
