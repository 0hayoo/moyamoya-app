// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_available_personality_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileAvailablePersonalityResponse
    _$UserProfileAvailablePersonalityResponseFromJson(
            Map<String, dynamic> json) =>
        UserProfileAvailablePersonalityResponse(
          (json['id'] as num).toInt(),
          json['content'] as String,
        );

Map<String, dynamic> _$UserProfileAvailablePersonalityResponseToJson(
        UserProfileAvailablePersonalityResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
    };
