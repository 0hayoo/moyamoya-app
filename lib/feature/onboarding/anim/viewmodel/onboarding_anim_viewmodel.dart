import 'package:get/get.dart';
import 'package:moyamoya/local/token/token_data_source.dart';

class OnboardingAnimViewModel extends GetxController {
  final _tokenDataSource = Get.find<TokenDataSource>();

  Future<bool> isLogin() async {
    final token = await _tokenDataSource.getToken();
    return token != null;
  }
}
