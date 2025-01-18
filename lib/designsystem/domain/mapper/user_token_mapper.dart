import 'package:moyamoya/designsystem/domain/model/user_token.dart';
import 'package:moyamoya/designsystem/network/user/response/user_token_response.dart';

extension UserTokenMapper on UserTokenResponse {
  UserToken toModel() {
    return UserToken(accessToken, refreshToken);
  }
}
