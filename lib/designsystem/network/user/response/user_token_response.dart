import 'package:json_annotation/json_annotation.dart';

part 'user_token_response.g.dart';

@JsonSerializable()
class UserTokenResponse {
  const UserTokenResponse(
    this.accessToken,
    this.refreshToken,
  );

  final String accessToken;
  final String refreshToken;

  factory UserTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$UserTokenResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserTokenResponseToJson(this);
}
