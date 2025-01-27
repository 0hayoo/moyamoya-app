// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_my_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMyInfoRequest _$UserMyInfoRequestFromJson(Map<String, dynamic> json) =>
    UserMyInfoRequest(
      messageInterval: json['messageInterval'] as String,
      fashionStyle: (json['fashionStyle'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      hasGlasses: json['hasGlasses'] as bool,
      height: (json['height'] as num).toInt(),
      mbti: json['mbti'] as String,
      faceType: json['faceType'] as String,
      bodyType: json['bodyType'] as String,
      hairStyle: UserHairStyleRequest.fromJson(
          json['hairStyle'] as Map<String, dynamic>),
      skinColor: json['skinColor'] as String,
    );

Map<String, dynamic> _$UserMyInfoRequestToJson(UserMyInfoRequest instance) =>
    <String, dynamic>{
      'messageInterval': instance.messageInterval,
      'fashionStyle': instance.fashionStyle,
      'hasGlasses': instance.hasGlasses,
      'height': instance.height,
      'mbti': instance.mbti,
      'faceType': instance.faceType,
      'bodyType': instance.bodyType,
      'hairStyle': instance.hairStyle,
      'skinColor': instance.skinColor,
    };
