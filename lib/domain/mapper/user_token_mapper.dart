import 'package:moyamoya/domain/model/user_token.dart';
import 'package:moyamoya/network/user/response/user_token_response.dart';

extension UserTokenMapper on UserTokenResponse {
  UserToken toModel() {
    return UserToken(accessToken, refreshToken);
  }
}
