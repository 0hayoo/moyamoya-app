import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:moyamoya/domain/mapper/user_verify_mapper.dart';
import 'package:moyamoya/domain/model/user_verify.dart';
import 'package:moyamoya/local/token/token_data_source.dart';
import 'package:moyamoya/network/core/base_url.dart';
import 'package:moyamoya/network/core/core_network.dart';
import 'package:moyamoya/network/core/get_result.dart';
import 'package:moyamoya/network/core/model/result.dart';
import 'package:moyamoya/network/core/safe_request.dart';
import 'package:moyamoya/network/user/request/user_send_code_request.dart';
import 'package:moyamoya/network/user/request/user_verify_request.dart';
import 'package:moyamoya/network/user/response/user_verify_response.dart';
import 'package:moyamoya/network/user/user_data_source.dart';

@LazySingleton(as: UserDataSource)
class UserDataSourceImpl implements UserDataSource {
  final tokenDataSource = Get.find<TokenDataSource>();

  @override
  Future<Result<void>> sendCode(String phone) async {
    return await getResult(() async {
      final response = (await coreDio.post<Map<String, dynamic>>(
        "${BaseUrl.user}/send-code",
        data: UserSendCodeRequest(phone),
      ))
          .safeRequest();
      return;
    });
  }

  @override
  Future<Result<UserVerify>> verifyCode(
    String phone,
    String code,
  ) async {
    return await getResult(
      () async {
        final response = (await coreDio.post<Map<String, dynamic>>(
          "${BaseUrl.user}/verify-code",
          data: UserVerifyRequest(phone, code),
        ))
            .safeRequest();

        final userVerify = UserVerifyResponse.fromJson(response).toModel();
        if (!userVerify.isNewUser) {
          tokenDataSource.saveToken(
            accessToken: userVerify.token!.accessToken,
            refreshToken: userVerify.token!.refreshToken,
          );
        }
        return userVerify;
      },
    );
  }

  @override
  Future<Result<List<String>>> availableProfiles() async {
    return await getResult(() async {
      final List<dynamic> response = (await coreDio
              .get<List<dynamic>>("${BaseUrl.user}/available-profile-images"))
          .safeRequest();

      return response.map((item) => item as String).toList();
    });
  }
}
