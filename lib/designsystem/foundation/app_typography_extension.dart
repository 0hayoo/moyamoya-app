import 'package:flutter/material.dart';

class AppTypographyExtension extends ThemeExtension<AppTypographyExtension> {
  const AppTypographyExtension({
    required this.display1Bold,
    required this.display1Medium,
    required this.display1Regular,
    required this.display2Bold,
    required this.display2Medium,
    required this.display2Regular,
    required this.title1Bold,
    required this.title1Medium,
    required this.title1Regular,
    required this.title2Bold,
    required this.title2Medium,
    required this.title2Regular,
    required this.title3Bold,
    required this.title3Medium,
    required this.title3Regular,
    required this.heading1Bold,
    required this.heading1Medium,
    required this.heading1Regular,
    required this.heading2Bold,
    required this.heading2Medium,
    required this.heading2Regular,
    required this.headlineBold,
    required this.headlineMedium,
    required this.headlineRegular,
    required this.bodyBold,
    required this.bodyMedium,
    required this.bodyRegular,
    required this.labelBold,
    required this.labelMedium,
    required this.labelRegular,
    required this.captionBold,
    required this.captionMedium,
    required this.captionRegular,
  });

  final TextStyle display1Bold;
  final TextStyle display1Medium;
  final TextStyle display1Regular;

  final TextStyle display2Bold;
  final TextStyle display2Medium;
  final TextStyle display2Regular;

  final TextStyle title1Bold;
  final TextStyle title1Medium;
  final TextStyle title1Regular;

  final TextStyle title2Bold;
  final TextStyle title2Medium;
  final TextStyle title2Regular;

  final TextStyle title3Bold;
  final TextStyle title3Medium;
  final TextStyle title3Regular;

  final TextStyle heading1Bold;
  final TextStyle heading1Medium;
  final TextStyle heading1Regular;

  final TextStyle heading2Bold;
  final TextStyle heading2Medium;
  final TextStyle heading2Regular;

  final TextStyle headlineBold;
  final TextStyle headlineMedium;
  final TextStyle headlineRegular;

  final TextStyle bodyBold;
  final TextStyle bodyMedium;
  final TextStyle bodyRegular;

  final TextStyle labelBold;
  final TextStyle labelMedium;
  final TextStyle labelRegular;

  final TextStyle captionBold;
  final TextStyle captionMedium;
  final TextStyle captionRegular;

  @override
  ThemeExtension<AppTypographyExtension> copyWith({
    TextStyle? display1Bold,
    TextStyle? display1Medium,
    TextStyle? display1Regular,
    TextStyle? display2Bold,
    TextStyle? display2Medium,
    TextStyle? display2Regular,
    TextStyle? title1Bold,
    TextStyle? title1Medium,
    TextStyle? title1Regular,
    TextStyle? title2Bold,
    TextStyle? title2Medium,
    TextStyle? title2Regular,
    TextStyle? title3Bold,
    TextStyle? title3Medium,
    TextStyle? title3Regular,
    TextStyle? heading1Bold,
    TextStyle? heading1Medium,
    TextStyle? heading1Regular,
    TextStyle? heading2Bold,
    TextStyle? heading2Medium,
    TextStyle? heading2Regular,
    TextStyle? headlineBold,
    TextStyle? headlineMedium,
    TextStyle? headlineRegular,
    TextStyle? bodyBold,
    TextStyle? bodyMedium,
    TextStyle? bodyRegular,
    TextStyle? labelBold,
    TextStyle? labelMedium,
    TextStyle? labelRegular,
    TextStyle? captionBold,
    TextStyle? captionMedium,
    TextStyle? captionRegular,
  }) {
    return AppTypographyExtension(
      display1Bold: display1Bold ?? this.display1Bold,
      display1Medium: display1Medium ?? this.display1Medium,
      display1Regular: display1Regular ?? this.display1Regular,
      display2Bold: display2Bold ?? this.display2Bold,
      display2Medium: display2Medium ?? this.display2Medium,
      display2Regular: display2Regular ?? this.display2Regular,
      title1Bold: title1Bold ?? this.title1Bold,
      title1Medium: title1Medium ?? this.title1Medium,
      title1Regular: title1Regular ?? this.title1Regular,
      title2Bold: title2Bold ?? this.title2Bold,
      title2Medium: title2Medium ?? this.title2Medium,
      title2Regular: title2Regular ?? this.title2Regular,
      title3Bold: title3Bold ?? this.title3Bold,
      title3Medium: title3Medium ?? this.title3Medium,
      title3Regular: title3Regular ?? this.title3Regular,
      heading1Bold: heading1Bold ?? this.heading1Bold,
      heading1Medium: heading1Medium ?? this.heading1Medium,
      heading1Regular: heading1Regular ?? this.heading1Regular,
      heading2Bold: heading2Bold ?? this.heading2Bold,
      heading2Medium: heading2Medium ?? this.heading2Medium,
      heading2Regular: heading2Regular ?? this.heading2Regular,
      headlineBold: headlineBold ?? this.headlineBold,
      headlineMedium: headlineMedium ?? this.headlineMedium,
      headlineRegular: headlineRegular ?? this.headlineRegular,
      bodyBold: bodyBold ?? this.bodyBold,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodyRegular: bodyRegular ?? this.bodyRegular,
      labelBold: labelBold ?? this.labelBold,
      labelMedium: labelMedium ?? this.labelMedium,
      labelRegular: labelRegular ?? this.labelRegular,
      captionBold: captionBold ?? this.captionBold,
      captionMedium: captionMedium ?? this.captionMedium,
      captionRegular: captionRegular ?? this.captionRegular,
    );
  }

  @override
  ThemeExtension<AppTypographyExtension> lerp(
      covariant ThemeExtension<AppTypographyExtension>? other,
      double t,
      ) {
    if (other is! AppTypographyExtension) {
      return this;
    }

    return AppTypographyExtension(
      display1Bold: TextStyle.lerp(display1Bold, other.display1Bold, t)!,
      display1Medium: TextStyle.lerp(display1Medium, other.display1Medium, t)!,
      display1Regular: TextStyle.lerp(display1Regular, other.display1Regular, t)!,
      display2Bold: TextStyle.lerp(display2Bold, other.display2Bold, t)!,
      display2Medium: TextStyle.lerp(display2Medium, other.display2Medium, t)!,
      display2Regular: TextStyle.lerp(display2Regular, other.display2Regular, t)!,
      title1Bold: TextStyle.lerp(title1Bold, other.title1Bold, t)!,
      title1Medium: TextStyle.lerp(title1Medium, other.title1Medium, t)!,
      title1Regular: TextStyle.lerp(title1Regular, other.title1Regular, t)!,
      title2Bold: TextStyle.lerp(title2Bold, other.title2Bold, t)!,
      title2Medium: TextStyle.lerp(title2Medium, other.title2Medium, t)!,
      title2Regular: TextStyle.lerp(title2Regular, other.title2Regular, t)!,
      title3Bold: TextStyle.lerp(title3Bold, other.title3Bold, t)!,
      title3Medium: TextStyle.lerp(title3Medium, other.title3Medium, t)!,
      title3Regular: TextStyle.lerp(title3Regular, other.title3Regular, t)!,
      heading1Bold: TextStyle.lerp(heading1Bold, other.heading1Bold, t)!,
      heading1Medium: TextStyle.lerp(heading1Medium, other.heading1Medium, t)!,
      heading1Regular: TextStyle.lerp(heading1Regular, other.heading1Regular, t)!,
      heading2Bold: TextStyle.lerp(heading2Bold, other.heading2Bold, t)!,
      heading2Medium: TextStyle.lerp(heading2Medium, other.heading2Medium, t)!,
      heading2Regular: TextStyle.lerp(heading2Regular, other.heading2Regular, t)!,
      headlineBold: TextStyle.lerp(headlineBold, other.headlineBold, t)!,
      headlineMedium: TextStyle.lerp(headlineMedium, other.headlineMedium, t)!,
      headlineRegular: TextStyle.lerp(headlineRegular, other.headlineRegular, t)!,
      bodyBold: TextStyle.lerp(bodyBold, other.bodyBold, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodyRegular: TextStyle.lerp(bodyRegular, other.bodyRegular, t)!,
      labelBold: TextStyle.lerp(labelBold, other.labelBold, t)!,
      labelMedium: TextStyle.lerp(labelMedium, other.labelMedium, t)!,
      labelRegular: TextStyle.lerp(labelRegular, other.labelRegular, t)!,
      captionBold: TextStyle.lerp(captionBold, other.captionBold, t)!,
      captionMedium: TextStyle.lerp(captionMedium, other.captionMedium, t)!,
      captionRegular: TextStyle.lerp(captionRegular, other.captionRegular, t)!,
    );
  }
}
