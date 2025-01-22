// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolResponse _$SchoolResponseFromJson(Map<String, dynamic> json) =>
    SchoolResponse(
      json['name'] as String,
      json['type'] as String?,
      json['cityName'] as String,
      json['postalCode'] as String?,
      json['address'] as String?,
      json['addressDetail'] as String?,
      json['phone'] as String,
      json['website'] as String?,
      DateTime.parse(json['foundedAt'] as String),
      DateTime.parse(json['anniversary'] as String),
      json['schoolCode'] as String,
      json['officeCode'] as String,
      (json['id'] as num).toInt(),
      DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$SchoolResponseToJson(SchoolResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'cityName': instance.cityName,
      'postalCode': instance.postalCode,
      'address': instance.address,
      'addressDetail': instance.addressDetail,
      'phone': instance.phone,
      'website': instance.website,
      'foundedAt': instance.foundedAt.toIso8601String(),
      'anniversary': instance.anniversary.toIso8601String(),
      'schoolCode': instance.schoolCode,
      'officeCode': instance.officeCode,
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
    };