import 'package:json_annotation/json_annotation.dart';
import 'package:moyamoya/network/user/request/user_ideal_type_request.dart';
import 'package:moyamoya/network/user/request/user_my_info_request.dart';

part 'user_profile_request.g.dart';

@JsonSerializable()
class UserProfileRequest {
  const UserProfileRequest({
    required this.myInfo,
    required this.idealType,
  });
  final UserMyInfoRequest myInfo;
  final UserIdealTypeRequest idealType;

  factory UserProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UserProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileRequestToJson(this);
}
