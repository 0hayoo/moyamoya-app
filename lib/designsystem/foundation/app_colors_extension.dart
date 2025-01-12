import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  AppColorsExtension({
    required this.labelNormal,
    required this.labelStrong,
    required this.labelNeutral,
    required this.labelAlternative,
    required this.labelAssistive,
    required this.labelDisable,
    required this.lineNormal,
    required this.lineNeutral,
    required this.lineAlternative,
    required this.fillNormal,
    required this.fillNeutral,
    required this.fillAlternative,
    required this.fillAssistive,
    required this.backgroundNormal,
    required this.backgroundNeutral,
    required this.backgroundAlternative,
    required this.elevationBlack1,
    required this.elevationBlack2,
    required this.elevationBlack3,
    required this.elevationPrimary1,
    required this.elevationPrimary2,
    required this.elevationPrimary3,
    required this.staticWhite,
    required this.staticBlack,
    required this.primaryNormal,
    required this.primaryAlternative,
    required this.primaryAssistive,
    required this.secondaryNormal,
    required this.secondaryAlternative,
    required this.secondaryAssistive,
    required this.statusNegative,
    required this.statusCautionary,
    required this.statusPositive,
  });

  final Color labelNormal;
  final Color labelStrong;
  final Color labelNeutral;
  final Color labelAlternative;
  final Color labelAssistive;
  final Color labelDisable;

  final Color lineNormal;
  final Color lineNeutral;
  final Color lineAlternative;

  final Color fillNormal;
  final Color fillNeutral;
  final Color fillAlternative;
  final Color fillAssistive;

  final Color backgroundNormal;
  final Color backgroundNeutral;
  final Color backgroundAlternative;

  final Color elevationBlack1;
  final Color elevationBlack2;
  final Color elevationBlack3;

  final Color elevationPrimary1;
  final Color elevationPrimary2;
  final Color elevationPrimary3;

  final Color staticWhite;
  final Color staticBlack;

  final Color primaryNormal;
  final Color primaryAlternative;
  final Color primaryAssistive;

  final Color secondaryNormal;
  final Color secondaryAlternative;
  final Color secondaryAssistive;

  final Color statusNegative;
  final Color statusCautionary;
  final Color statusPositive;



  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? labelNormal,
    Color? labelStrong,
    Color? labelNeutral,
    Color? labelAlternative,
    Color? labelAssistive,
    Color? labelDisable,
    Color? lineNormal,
    Color? lineNeutral,
    Color? lineAlternative,
    Color? fillNormal,
    Color? fillNeutral,
    Color? fillAlternative,
    Color? fillAssistive,
    Color? backgroundNormal,
    Color? backgroundNeutral,
    Color? backgroundAlternative,
    Color? elevationBlack1,
    Color? elevationBlack2,
    Color? elevationBlack3,
    Color? elevationPrimary1,
    Color? elevationPrimary2,
    Color? elevationPrimary3,
    Color? staticWhite,
    Color? staticBlack,
    Color? primaryNormal,
    Color? primaryAlternative,
    Color? primaryAssistive,
    Color? secondaryNormal,
    Color? secondaryAlternative,
    Color? secondaryAssistive,
    Color? statusNegative,
    Color? statusCautionary,
    Color? statusPositive,
  }) {
    return AppColorsExtension(
      labelNormal: labelNormal ?? this.labelNormal,
      labelStrong: labelStrong ?? this.labelStrong,
      labelNeutral: labelNeutral ?? this.labelNeutral,
      labelAlternative: labelAlternative ?? this.labelAlternative,
      labelAssistive: labelAssistive ?? this.labelAssistive,
      labelDisable: labelDisable ?? this.labelDisable,
      lineNormal: lineNormal ?? this.lineNormal,
      lineNeutral: lineNeutral ?? this.lineNeutral,
      lineAlternative: lineAlternative ?? this.lineAlternative,
      fillNormal: fillNormal ?? this.fillNormal,
      fillNeutral: fillNeutral ?? this.fillNeutral,
      fillAlternative: fillAlternative ?? this.fillAlternative,
      fillAssistive: fillAssistive ?? this.fillAssistive,
      backgroundNormal: backgroundNormal ?? this.backgroundNormal,
      backgroundNeutral: backgroundNeutral ?? this.backgroundNeutral,
      backgroundAlternative: backgroundAlternative ?? this.backgroundAlternative,
      elevationBlack1: elevationBlack1 ?? this.elevationBlack1,
      elevationBlack2: elevationBlack2 ?? this.elevationBlack2,
      elevationBlack3: elevationBlack3 ?? this.elevationBlack3,
      elevationPrimary1: elevationPrimary1 ?? this.elevationPrimary1,
      elevationPrimary2: elevationPrimary2 ?? this.elevationPrimary2,
      elevationPrimary3: elevationPrimary3 ?? this.elevationPrimary3,
      staticWhite: staticWhite ?? this.staticWhite,
      staticBlack: staticBlack ?? this.staticBlack,
      primaryNormal: primaryNormal ?? this.primaryNormal,
      primaryAlternative: primaryAlternative ?? this.primaryAlternative,
      primaryAssistive: primaryAssistive ?? this.primaryAssistive,
      secondaryNormal: secondaryNormal ?? this.secondaryNormal,
      secondaryAlternative: secondaryAlternative ?? this.secondaryAlternative,
      secondaryAssistive: secondaryAssistive ?? this.secondaryAssistive,
      statusNegative: statusNegative ?? this.statusNegative,
      statusCautionary: statusCautionary ?? this.statusCautionary,
      statusPositive: statusPositive ?? this.statusPositive,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) {
      return this;
    }

    return AppColorsExtension(
      labelNormal: Color.lerp(labelNormal, other.labelNormal, t)!,
      labelStrong: Color.lerp(labelStrong, other.labelStrong, t)!,
      labelNeutral: Color.lerp(labelNeutral, other.labelNeutral, t)!,
      labelAlternative: Color.lerp(labelAlternative, other.labelAlternative, t)!,
      labelAssistive: Color.lerp(labelAssistive, other.labelAssistive, t)!,
      labelDisable: Color.lerp(labelDisable, other.labelDisable, t)!,
      lineNormal: Color.lerp(lineNormal, other.lineNormal, t)!,
      lineNeutral: Color.lerp(lineNeutral, other.lineNeutral, t)!,
      lineAlternative: Color.lerp(lineAlternative, other.lineAlternative, t)!,
      fillNormal: Color.lerp(fillNormal, other.fillNormal, t)!,
      fillNeutral: Color.lerp(fillNeutral, other.fillNeutral, t)!,
      fillAlternative: Color.lerp(fillAlternative, other.fillAlternative, t)!,
      fillAssistive: Color.lerp(fillAssistive, other.fillAssistive, t)!,
      backgroundNormal: Color.lerp(backgroundNormal, other.backgroundNormal, t)!,
      backgroundNeutral: Color.lerp(backgroundNeutral, other.backgroundNeutral, t)!,
      backgroundAlternative: Color.lerp(backgroundAlternative, other.backgroundAlternative, t)!,
      elevationBlack1: Color.lerp(elevationBlack1, other.elevationBlack1, t)!,
      elevationBlack2: Color.lerp(elevationBlack2, other.elevationBlack2, t)!,
      elevationBlack3: Color.lerp(elevationBlack3, other.elevationBlack3, t)!,
      elevationPrimary1: Color.lerp(elevationPrimary1, other.elevationPrimary1, t)!,
      elevationPrimary2: Color.lerp(elevationPrimary2, other.elevationPrimary2, t)!,
      elevationPrimary3: Color.lerp(elevationPrimary3, other.elevationPrimary3, t)!,
      staticWhite: Color.lerp(staticWhite, other.staticWhite, t)!,
      staticBlack: Color.lerp(staticBlack, other.staticBlack, t)!,
      primaryNormal: Color.lerp(primaryNormal, other.primaryNormal, t)!,
      primaryAlternative: Color.lerp(primaryAlternative, other.primaryAlternative, t)!,
      primaryAssistive: Color.lerp(primaryAssistive, other.primaryAssistive, t)!,
      secondaryNormal: Color.lerp(secondaryNormal, other.secondaryNormal, t)!,
      secondaryAlternative: Color.lerp(secondaryAlternative, other.secondaryAlternative, t)!,
      secondaryAssistive: Color.lerp(secondaryAssistive, other.secondaryAssistive, t)!,
      statusNegative: Color.lerp(statusNegative, other.statusNegative, t)!,
      statusCautionary: Color.lerp(statusCautionary, other.statusCautionary, t)!,
      statusPositive: Color.lerp(statusPositive, other.statusPositive, t)!,
    );
  }
}