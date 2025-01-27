import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_ideal_type.dart';
import 'package:moyamoya/domain/model/user_my_info.dart';
import 'package:moyamoya/network/core/model/result.dart';
import 'package:moyamoya/network/user/user_data_source.dart';

class InputIdealTypeFinishViewModel extends GetxController {
  final UserDataSource _userDataSource = Get.find<UserDataSource>();
  RxBool isLoading = false.obs;

  Future<bool> sendProfile({
    required UserMyInfo myInfo,
    required UserIdealType idealType,
  }) async {
    isLoading.update((_) => true);
    final result =
        await _userDataSource.postProfile(myInfo: myInfo, idealType: idealType);
    isLoading.update((_) => false);
    switch (result) {
      case Success<void>():
        return true;
      case Error<void>():
        result.error.printError();
        Get.snackbar("Error", result.error.toString());
        return false;
    }
  }
}
