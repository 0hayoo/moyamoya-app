// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_token_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserTokenResponse _$UserTokenResponseFromJson(Map<String, dynamic> json) =>
    UserTokenResponse(
      json['accessToken'] as String,
      json['refreshToken'] as String,
    );

Map<String, dynamic> _$UserTokenResponseToJson(UserTokenResponse instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
