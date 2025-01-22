import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_verify.dart';
import 'package:moyamoya/network/core/model/result.dart';
import 'package:moyamoya/network/user/user_data_source.dart';

class SignUpAuthPhoneViewModel extends GetxController {
  SignUpAuthPhoneViewModel({
    required this.onVerifySuccess,
  });

  var isLoading = false.obs;
  var isSending = false.obs;
  final userDataSource = Get.find<UserDataSource>();
  final Function() onVerifySuccess;

  Future<bool> sendCode(String phone) async {
    isSending.value = true;
    final result = await userDataSource.sendCode(phone);
    switch (result) {
      case Success<void>():
        "";
      case Error<void>():
        Get.snackbar("Error", result.error.toString());
    }
    isSending.value = false;
    return true;
  }

  Future<bool> verifyCode(String phone, String code) async {
    isLoading.value = true;
    final result = await userDataSource.verifyCode(phone, code);
    switch (result) {
      case Success<UserVerify>():
        onVerifySuccess();
      case Error<UserVerify>():
        Get.snackbar("Error", result.error.toString());
    }
    isLoading.value = false;
    return true;
  }
}
