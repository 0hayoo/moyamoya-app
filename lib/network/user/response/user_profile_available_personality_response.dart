import 'package:json_annotation/json_annotation.dart';

part 'user_profile_available_personality_response.g.dart';

@JsonSerializable()
class UserProfileAvailablePersonalityResponse {
  const UserProfileAvailablePersonalityResponse(this.id, this.content);

  final int id;
  final String content;

  factory UserProfileAvailablePersonalityResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UserProfileAvailablePersonalityResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$UserProfileAvailablePersonalityResponseToJson(this);
}
