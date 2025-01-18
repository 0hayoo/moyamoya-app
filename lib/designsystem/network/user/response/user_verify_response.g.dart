// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_verify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserVerifyResponse _$UserVerifyResponseFromJson(Map<String, dynamic> json) =>
    UserVerifyResponse(
      json['isNewUser'] as bool,
      UserTokenResponse.fromJson(json['token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserVerifyResponseToJson(UserVerifyResponse instance) =>
    <String, dynamic>{
      'isNewUser': instance.isNewUser,
      'token': instance.token,
    };
