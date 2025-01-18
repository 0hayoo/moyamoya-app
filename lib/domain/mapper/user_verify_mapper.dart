import 'package:moyamoya/domain/mapper/user_token_mapper.dart';
import 'package:moyamoya/domain/model/user_verify.dart';
import 'package:moyamoya/network/user/response/user_verify_response.dart';

extension UserVerifyMapper on UserVerifyResponse {
  UserVerify toModel() {
    return UserVerify(isNewUser, token?.toModel());
  }
}
