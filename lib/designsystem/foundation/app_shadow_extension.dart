import 'package:flutter/material.dart';

class AppShadowExtension extends ThemeExtension<AppShadowExtension> {
  AppShadowExtension({
    required this.black1,
    required this.black2,
    required this.black3,
    required this.primary1,
    required this.primary2,
    required this.primary3,
  });

  final BoxShadow black1;
  final BoxShadow black2;
  final BoxShadow black3;

  final BoxShadow primary1;
  final BoxShadow primary2;
  final BoxShadow primary3;

  @override
  ThemeExtension<AppShadowExtension> copyWith({
    BoxShadow? black1,
    BoxShadow? black2,
    BoxShadow? black3,
    BoxShadow? primary1,
    BoxShadow? primary2,
    BoxShadow? primary3,
  }) {
    return AppShadowExtension(
      black1: black1 ?? this.black1,
      black2: black2 ?? this.black2,
      black3: black3 ?? this.black3,
      primary1: primary1 ?? this.primary1,
      primary2: primary2 ?? this.primary2,
      primary3: primary1 ?? this.primary2,
    );
  }

  @override
  ThemeExtension<AppShadowExtension> lerp(
    covariant ThemeExtension<AppShadowExtension>? other,
    double t,
  ) {
    if (other is! AppShadowExtension) {
      return this;
    }
    return AppShadowExtension(
      black1: BoxShadow.lerp(black1, other.black1, t)!,
      black2: BoxShadow.lerp(black2, other.black2, t)!,
      black3: BoxShadow.lerp(black3, other.black3, t)!,
      primary1: BoxShadow.lerp(primary1, other.primary1, t)!,
      primary2: BoxShadow.lerp(primary2, other.primary2, t)!,
      primary3: BoxShadow.lerp(primary3, other.primary3, t)!,
    );
  }
}
