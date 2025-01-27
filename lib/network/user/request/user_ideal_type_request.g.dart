// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_ideal_type_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserIdealTypeRequest _$UserIdealTypeRequestFromJson(
        Map<String, dynamic> json) =>
    UserIdealTypeRequest(
      messageInterval: json['messageInterval'] as String,
      fashionStyle: (json['fashionStyle'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      hasGlasses: json['hasGlasses'] as bool,
      heightLevel: json['heightLevel'] as String,
      ageType: json['ageType'] as String,
      personality: (json['personality'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
      faceType: json['faceType'] as String,
      bodyType: json['bodyType'] as String,
      hairStyle: UserHairStyleRequest.fromJson(
          json['hairStyle'] as Map<String, dynamic>),
      skinColor: json['skinColor'] as String,
    );

Map<String, dynamic> _$UserIdealTypeRequestToJson(
        UserIdealTypeRequest instance) =>
    <String, dynamic>{
      'messageInterval': instance.messageInterval,
      'fashionStyle': instance.fashionStyle,
      'hasGlasses': instance.hasGlasses,
      'heightLevel': instance.heightLevel,
      'ageType': instance.ageType,
      'personality': instance.personality,
      'faceType': instance.faceType,
      'bodyType': instance.bodyType,
      'hairStyle': instance.hairStyle,
      'skinColor': instance.skinColor,
    };
