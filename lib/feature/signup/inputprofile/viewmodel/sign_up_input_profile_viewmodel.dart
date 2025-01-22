import 'package:get/get.dart';
import 'package:moyamoya/network/core/model/result.dart';
import 'package:moyamoya/network/user/user_data_source.dart';

class SignUpInputProfileViewModel extends GetxController {
  final userDataSource = Get.find<UserDataSource>();

  final RxList<String> profileImages = RxList.empty();

  Future<void> getProfileImageList() async {
    final response = await userDataSource.availableProfiles();

    switch (response) {
      case Success<List<String>>():
        profileImages.value = response.data;
      case Error<List<String>>():
        response.error.printError();
        Get.snackbar("Error", response.error.toString());
    }
    return;
  }
}
