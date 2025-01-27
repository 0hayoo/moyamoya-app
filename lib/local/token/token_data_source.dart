import 'dart:async';

import 'package:moyamoya/domain/model/user_token.dart';

interface class TokenDataSource {
  Future<void> saveToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    throw UnimplementedError();
  }

  Future<void> saveAccessToken({
    required String accessToken,
  }) async {
    throw UnimplementedError();
  }

  Future<UserToken?> getToken() async {
    throw UnimplementedError();
  }
}
