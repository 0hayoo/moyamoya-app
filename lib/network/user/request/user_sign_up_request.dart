import 'package:json_annotation/json_annotation.dart';

part 'user_sign_up_request.g.dart';

@JsonSerializable()
class UserSignUpRequest {
  const UserSignUpRequest({
    required this.phone,
    required this.schoolId,
    required this.schoolGrade,
    required this.schoolClass,
    required this.name,
    required this.gender,
    required this.profileImageUrl,
    required this.code,
  });
  final String phone;
  final int schoolId;
  final int schoolGrade;
  final int schoolClass;
  final String name;
  final String gender;
  final String profileImageUrl;
  final String code;

  factory UserSignUpRequest.fromJson(Map<String, dynamic> json) =>
      _$UserSignUpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserSignUpRequestToJson(this);
}
