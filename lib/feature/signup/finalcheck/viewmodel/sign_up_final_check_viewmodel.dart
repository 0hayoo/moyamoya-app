import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_token.dart';
import 'package:moyamoya/network/core/model/result.dart';
import 'package:moyamoya/network/user/user_data_source.dart';

class SignUpFinalCheckViewModel extends GetxController {
  final UserDataSource _userDataSource = Get.find<UserDataSource>();
  RxBool isLoading = false.obs;

  Future<bool> signUp({
    required String phone,
    required int schoolId,
    required int schoolGrade,
    required int schoolClass,
    required String name,
    required String gender,
    required String profileImageUrl,
    required String verifyCode,
  }) async {
    isLoading.update((_) => true);
    final result = await _userDataSource.signUp(
      phone: phone,
      schoolId: schoolId,
      schoolGrade: schoolGrade,
      schoolClass: schoolClass,
      name: name,
      gender: gender,
      profileImageUrl: profileImageUrl,
      verifyCode: verifyCode,
    );

    switch (result) {
      case Success<UserToken>():
        return true;
      case Error<UserToken>():
        result.error.printError();
        Get.snackbar("Error", result.error.toString());
        return false;
    }
  }
}
