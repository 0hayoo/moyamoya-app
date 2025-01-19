import 'package:moyamoya/domain/model/school.dart';
import 'package:moyamoya/network/school/response/school_response.dart';

extension SchoolMapper on SchoolResponse {
  School toModel() {
    return School(
      name,
      switch (type) {
        "HIGH" => SchoolType.high,
        "MIDDLE" => SchoolType.middle,
        "ELEMENTARY" => SchoolType.elementary,
        _ => null
      },
      cityName,
      postalCode,
      address,
      addressDetail,
      phone,
      website,
      foundedAt,
      anniversary,
      schoolCode,
      officeCode,
      id,
      createdAt,
    );
  }
}

extension SchoolListMapper on List<SchoolResponse> {
  List<School> toModels() => map((response) => response.toModel()).toList();
}
