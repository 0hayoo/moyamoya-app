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
    // final resultone = await userDataSource.sendCode(phone);
    // switch (resultone) {
    //   case Success<void>():
    //     "";
    //   case Error<void>():
    //     Get.snackbar("Error", resultone.error.toString());
    // }
    isSending.value = false;
    return true;
  }

  Future<bool?> verifyCode(String phone, String code) async {
    isLoading.value = true;
    final result = await userDataSource.verifyCode(phone, code);
    isLoading.value = false;
    switch (result) {
      case Success<UserVerify>():
        return result.data.isNewUser;
      case Error<UserVerify>():
        return null;
    }
    // return true;
  }
}
