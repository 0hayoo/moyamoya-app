import 'package:json_annotation/json_annotation.dart';
import 'package:moyamoya/network/user/request/user_hair_style_request.dart';

part 'user_ideal_type_request.g.dart';

@JsonSerializable()
class UserIdealTypeRequest {
  UserIdealTypeRequest({
    required this.messageInterval,
    required this.fashionStyle,
    required this.hasGlasses,
    required this.heightLevel,
    required this.ageType,
    required this.personality,
    required this.faceType,
    required this.bodyType,
    required this.hairStyle,
    required this.skinColor,
  });

  final String messageInterval;
  final List<String> fashionStyle;
  final bool hasGlasses;
  final String heightLevel;
  final String ageType;
  final List<int> personality;
  final String faceType;
  final String bodyType;
  final UserHairStyleRequest hairStyle;
  final String skinColor;

  factory UserIdealTypeRequest.fromJson(Map<String, dynamic> json) =>
      _$UserIdealTypeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserIdealTypeRequestToJson(this);
}
