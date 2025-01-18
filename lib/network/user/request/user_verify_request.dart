import 'package:json_annotation/json_annotation.dart';

part 'user_verify_request.g.dart';

@JsonSerializable()
class UserVerifyRequest {
  const UserVerifyRequest(this.phone, this.code);

  final String phone;
  final String code;

  factory UserVerifyRequest.fromJson(Map<String, dynamic> json) =>
      _$UserVerifyRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserVerifyRequestToJson(this);
}
