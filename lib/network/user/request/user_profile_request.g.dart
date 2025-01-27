// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileRequest _$UserProfileRequestFromJson(Map<String, dynamic> json) =>
    UserProfileRequest(
      myInfo:
          UserMyInfoRequest.fromJson(json['myInfo'] as Map<String, dynamic>),
      idealType: UserIdealTypeRequest.fromJson(
          json['idealType'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileRequestToJson(UserProfileRequest instance) =>
    <String, dynamic>{
      'myInfo': instance.myInfo,
      'idealType': instance.idealType,
    };
