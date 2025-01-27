// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_sign_up_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignUpRequest _$UserSignUpRequestFromJson(Map<String, dynamic> json) =>
    UserSignUpRequest(
      phone: json['phone'] as String,
      schoolId: (json['schoolId'] as num).toInt(),
      schoolGrade: (json['schoolGrade'] as num).toInt(),
      schoolClass: (json['schoolClass'] as num).toInt(),
      name: json['name'] as String,
      gender: json['gender'] as String,
      profileImageUrl: json['profileImageUrl'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$UserSignUpRequestToJson(UserSignUpRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'schoolId': instance.schoolId,
      'schoolGrade': instance.schoolGrade,
      'schoolClass': instance.schoolClass,
      'name': instance.name,
      'gender': instance.gender,
      'profileImageUrl': instance.profileImageUrl,
      'code': instance.code,
    };
