enum SchoolType { high, middle, elementary }

class School {
  const School(
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
    this.id,
    this.createdAt,
  );

  final String name;
  final SchoolType? type;
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
  final int id;
  final DateTime createdAt;
}
