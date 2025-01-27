import 'package:get/get.dart';
import 'package:moyamoya/domain/model/user_profile_available_personality.dart';
import 'package:moyamoya/network/core/model/result.dart';
import 'package:moyamoya/network/user/user_data_source.dart';

class InputIdealTypePersonalityViewModel extends GetxController {
  final UserDataSource _userDataSource = Get.find<UserDataSource>();
  RxList<UserProfileAvailablePersonality> availablePersonalities =
      RxList.empty();

  Future<void> load() async {
    final result = await _userDataSource.availablePersonality();

    switch (result) {
      case Success<List<UserProfileAvailablePersonality>>():
        availablePersonalities.assignAll(result.data);
      case Error<List<UserProfileAvailablePersonality>>():
        Get.snackbar("Error", result.error.toString());
    }
  }
}
