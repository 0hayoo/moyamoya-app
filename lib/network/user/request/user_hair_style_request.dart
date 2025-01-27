import 'package:json_annotation/json_annotation.dart';

part 'user_hair_style_request.g.dart';

@JsonSerializable()
class UserHairStyleRequest {
  const UserHairStyleRequest(
    this.length,
    this.isCurly,
    this.hasPerm,
    this.hasBang,
  );

  final String length;
  final bool isCurly;
  final bool hasPerm;
  final bool hasBang;

  factory UserHairStyleRequest.fromJson(Map<String, dynamic> json) =>
      _$UserHairStyleRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserHairStyleRequestToJson(this);
}
