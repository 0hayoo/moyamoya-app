import 'package:moyamoya/designsystem/domain/mapper/user_token_mapper.dart';
import 'package:moyamoya/designsystem/domain/model/user_verify.dart';
import 'package:moyamoya/designsystem/network/user/response/user_verify_response.dart';

extension UserVerifyMapper on UserVerifyResponse {
  UserVerify toModel() {
    return UserVerify(isNewUser, token.toModel());
  }
}
