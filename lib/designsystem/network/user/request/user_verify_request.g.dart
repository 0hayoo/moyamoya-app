// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_verify_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserVerifyRequest _$UserVerifyRequestFromJson(Map<String, dynamic> json) =>
    UserVerifyRequest(
      json['phone'] as String,
      json['code'] as String,
    );

Map<String, dynamic> _$UserVerifyRequestToJson(UserVerifyRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'code': instance.code,
    };
