import 'package:json_annotation/json_annotation.dart';

part 'school_response.g.dart';

@JsonSerializable()
class SchoolResponse {
  const SchoolResponse(
      this.id,
      this.name,
      this.type,
      this.cityName,
      this.postalCode,
      this.address,
      this.addressDetail,
      this.phone,
      this.website,
      this.foundedAt,
      this.anniversary,
      this.schoolCode,
      this.officeCode,
      this.studentCount);

  final int id;
  final String name;
  final String? type;
  final String cityName;
  final String? postalCode;
  final String? address;
  final String? addressDetail;
  final String phone;
  final String? website;
  final DateTime foundedAt;
  final DateTime anniversary;
  final String schoolCode;
  final String officeCode;
  final int studentCount;

  factory SchoolResponse.fromJson(Map<String, dynamic> json) =>
      _$SchoolResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolResponseToJson(this);
}
