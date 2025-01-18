import 'package:json_annotation/json_annotation.dart';

part 'user_send_code_request.g.dart';

@JsonSerializable()
class UserSendCodeRequest {
  const UserSendCodeRequest(this.phone);
  final String phone;

  factory UserSendCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$UserSendCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserSendCodeRequestToJson(this);
}
