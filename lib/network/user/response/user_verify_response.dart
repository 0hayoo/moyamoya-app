import 'package:json_annotation/json_annotation.dart';

import 'user_token_response.dart';

part 'user_verify_response.g.dart';

@JsonSerializable()
class UserVerifyResponse {
  const UserVerifyResponse(this.isNewUser, this.token);

  final bool isNewUser;
  final UserTokenResponse? token;

  factory UserVerifyResponse.fromJson(Map<String, dynamic> json) =>
      _$UserVerifyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserVerifyResponseToJson(this);
}
