import 'package:json_annotation/json_annotation.dart';
import 'package:moyamoya/network/user/request/user_hair_style_request.dart';

part 'user_my_info_request.g.dart';

@JsonSerializable()
class UserMyInfoRequest {
  UserMyInfoRequest({
    required this.messageInterval,
    required this.fashionStyle,
    required this.hasGlasses,
    required this.height,
    required this.mbti,
    required this.faceType,
    required this.bodyType,
    required this.hairStyle,
    required this.skinColor,
  });

  final String messageInterval;
  final List<String> fashionStyle;
  final bool hasGlasses;
  final int height;
  final String mbti;
  final String faceType;
  final String bodyType;
  final UserHairStyleRequest hairStyle;
  final String skinColor;

  factory UserMyInfoRequest.fromJson(Map<String, dynamic> json) =>
      _$UserMyInfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserMyInfoRequestToJson(this);
}
