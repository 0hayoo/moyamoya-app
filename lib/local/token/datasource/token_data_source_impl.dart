import 'dart:async';

import 'package:moyamoya/domain/model/user_token.dart';
import 'package:moyamoya/local/core/moya_flutter_secure_storage.dart';
import 'package:moyamoya/local/token/token_data_source.dart';

class TokenDataSourceImpl implements TokenDataSource {
  static const String _refreshTokenKey = "refreshTokenKey";
  static const String _accessTokenKey = "accessTokenKey";
  @override
  Future<void> saveToken({
    required String accessToken,
    required String refreshToken,
  }) async {
    await moyaFlutterSecureStorage.write(
      key: _accessTokenKey,
      value: accessToken,
    );
    await moyaFlutterSecureStorage.write(
      key: _refreshTokenKey,
      value: refreshToken,
    );
  }

  @override
  Future<UserToken?> getToken() async {
    final accessToken =
        await moyaFlutterSecureStorage.read(key: _accessTokenKey);
    final refreshToken =
        await moyaFlutterSecureStorage.read(key: _refreshTokenKey);

    if (accessToken == null || refreshToken == null) {
      return null;
    }
    return UserToken(
      accessToken,
      refreshToken,
    );
  }
}
