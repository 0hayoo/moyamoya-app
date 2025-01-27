// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_hair_style_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserHairStyleRequest _$UserHairStyleRequestFromJson(
        Map<String, dynamic> json) =>
    UserHairStyleRequest(
      json['length'] as String,
      json['isCurly'] as bool,
      json['hasPerm'] as bool,
      json['hasBang'] as bool,
    );

Map<String, dynamic> _$UserHairStyleRequestToJson(
        UserHairStyleRequest instance) =>
    <String, dynamic>{
      'length': instance.length,
      'isCurly': instance.isCurly,
      'hasPerm': instance.hasPerm,
      'hasBang': instance.hasBang,
    };
