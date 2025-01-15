import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/foundation/app_palette.dart';
import 'package:moyamoya/designsystem/foundation/app_shadow_extension.dart';
import 'package:moyamoya/designsystem/foundation/app_typography.dart';

import 'app_colors_extension.dart';
import 'app_typography_extension.dart';

class AppTheme with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  //
  // Light theme
  //

  static final light = ThemeData.light().copyWith(
    extensions: [
      _lightAppColors,
      _lightAppTypography,
      _lightAppShadow,
    ],
  );

  static final _lightAppColors = AppColorsExtension(
    labelNormal: AppPalette.neutral5,
    labelStrong: AppPalette.common100,
    labelNeutral: AppPalette.neutral25,
    labelAlternative: AppPalette.neutral40,
    labelAssistive: AppPalette.neutral50,
    labelDisable: AppPalette.neutral97,
    lineNormal: AppPalette.neutral90,
    lineNeutral: AppPalette.neutral95,
    lineAlternative: AppPalette.neutral97,
    fillNormal: AppPalette.neutral97,
    fillNeutral: AppPalette.neutral95,
    fillAlternative: AppPalette.neutral90,
    fillAssistive: AppPalette.common00,
    backgroundNormal: AppPalette.common00,
    backgroundNeutral: AppPalette.neutral99,
    backgroundAlternative: AppPalette.neutral99,
    elevationBlack1: Color(0x05000000),
    elevationBlack2: Color(0x0A000000),
    elevationBlack3: Color(0x0F000000),
    elevationPrimary1: AppPalette.babyPink20.withValues(alpha: 0.08),
    elevationPrimary2: AppPalette.babyPink20.withValues(alpha: 0.2),
    elevationPrimary3: AppPalette.babyPink20.withValues(alpha: 0.24),
    staticWhite: AppPalette.common00,
    staticBlack: AppPalette.common100,
    primaryNormal: AppPalette.babyPink20,
    primaryAlternative: AppPalette.babyPink20.withValues(alpha: 0.65),
    primaryAssistive: AppPalette.babyPink20.withValues(alpha: 0.20),
    secondaryNormal: AppPalette.babyPink80,
    secondaryAlternative: AppPalette.babyPink80.withValues(alpha: 0.65),
    secondaryAssistive: AppPalette.babyPink80.withValues(alpha: 0.65),
    statusNegative: AppPalette.red50,
    statusCautionary: AppPalette.yellow50,
    statusPositive: AppPalette.green50,
    statusHovered: AppPalette.common100.withValues(alpha: 0.06),
  );

  static final _lightAppTypography = AppTypographyExtension(
    display1Bold: AppTypography.display1Bold.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    display1Medium: AppTypography.display1Medium.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    display1Regular: AppTypography.display1Regular.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    display2Bold: AppTypography.display2Bold.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    display2Medium: AppTypography.display2Medium.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    display2Regular: AppTypography.display2Regular.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    title1Bold: AppTypography.title1Bold.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    title1Medium: AppTypography.title1Medium.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    title1Regular: AppTypography.title1Regular.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    title2Bold: AppTypography.title2Bold.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    title2Medium: AppTypography.title2Medium.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    title2Regular: AppTypography.title2Regular.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    title3Bold: AppTypography.title3Bold.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    title3Medium: AppTypography.title3Medium.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    title3Regular: AppTypography.title3Regular.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    heading1Bold: AppTypography.heading1Bold.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    heading1Medium: AppTypography.heading1Medium.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    heading1Regular: AppTypography.heading1Regular.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    heading2Bold: AppTypography.heading2Bold.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    heading2Medium: AppTypography.heading2Medium.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    heading2Regular: AppTypography.heading2Regular.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    headlineBold: AppTypography.headlineBold.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    headlineMedium: AppTypography.headlineMedium.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    headlineRegular: AppTypography.headlineRegular.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    bodyBold: AppTypography.bodyBold.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    bodyMedium: AppTypography.bodyMedium.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    bodyRegular: AppTypography.bodyRegular.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    labelBold: AppTypography.labelBold.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    labelMedium: AppTypography.labelMedium.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    labelRegular: AppTypography.labelRegular.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    captionBold: AppTypography.captionBold.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    captionMedium: AppTypography.captionMedium.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    captionRegular: AppTypography.captionRegular.copyWith(
      color: _lightAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
  );

  static final _lightAppShadow = AppShadowExtension(
      black1: BoxShadow(
          color: _lightAppColors.elevationBlack1,
          offset: Offset(0, 3),
          blurRadius: 10.0),
      black2: BoxShadow(
          color: _lightAppColors.elevationBlack2,
          offset: Offset(0, 4),
          blurRadius: 12.0),
      black3: BoxShadow(
          color: _lightAppColors.elevationBlack3,
          offset: Offset(0, 6),
          blurRadius: 18.0),
      primary1: BoxShadow(
          color: _lightAppColors.elevationPrimary1,
          offset: Offset(0, 3),
          blurRadius: 10.0),
      primary2: BoxShadow(
          color: _lightAppColors.elevationPrimary2,
          offset: Offset(0, 4),
          blurRadius: 12.0),
      primary3: BoxShadow(
          color: _lightAppColors.elevationPrimary3,
          offset: Offset(0, 6),
          blurRadius: 18.0));

  //
  // Dark theme
  //

  static final dark = ThemeData.dark().copyWith(
    extensions: [_darkAppColors, _darkAppTypography, _darkAppShadow],
  );

  static final _darkAppColors = AppColorsExtension(
    labelNormal: AppPalette.neutral99,
    labelStrong: AppPalette.common00,
    labelNeutral: AppPalette.neutral95,
    labelAlternative: AppPalette.neutral90,
    labelAssistive: AppPalette.neutral70,
    labelDisable: AppPalette.neutral30,
    lineNormal: AppPalette.neutral50,
    lineNeutral: AppPalette.neutral30,
    lineAlternative: AppPalette.neutral25,
    fillNormal: AppPalette.neutral20,
    fillNeutral: AppPalette.neutral25,
    fillAlternative: AppPalette.neutral30,
    fillAssistive: AppPalette.neutral60,
    backgroundNormal: AppPalette.neutral15,
    backgroundNeutral: AppPalette.neutral10,
    backgroundAlternative: AppPalette.neutral7,
    elevationBlack1: Color(0x05CCCCD6),
    elevationBlack2: Color(0x0ACCCCD6),
    elevationBlack3: Color(0x0FCCCCD6),
    elevationPrimary1: AppPalette.babyPink20.withValues(alpha: 0.08),
    elevationPrimary2: AppPalette.babyPink20.withValues(alpha: 0.2),
    elevationPrimary3: AppPalette.babyPink20.withValues(alpha: 0.24),
    staticWhite: AppPalette.common00,
    staticBlack: AppPalette.common100,
    primaryNormal: AppPalette.babyPink20,
    primaryAlternative: AppPalette.babyPink20.withValues(alpha: 0.65),
    primaryAssistive: AppPalette.babyPink20.withValues(alpha: 0.20),
    secondaryNormal: AppPalette.babyPink80,
    secondaryAlternative: AppPalette.babyPink80.withValues(alpha: 0.65),
    secondaryAssistive: AppPalette.babyPink80.withValues(alpha: 0.65),
    statusNegative: AppPalette.red50,
    statusCautionary: AppPalette.yellow50,
    statusPositive: AppPalette.green50,
    statusHovered: AppPalette.common00.withValues(alpha: 0.06),
  );

  static final _darkAppTypography = AppTypographyExtension(
    display1Bold: AppTypography.display1Bold.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    display1Medium: AppTypography.display1Medium.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    display1Regular: AppTypography.display1Regular.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    display2Bold: AppTypography.display2Bold.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    display2Medium: AppTypography.display2Medium.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    display2Regular: AppTypography.display2Regular.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    title1Bold: AppTypography.title1Bold.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    title1Medium: AppTypography.title1Medium.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    title1Regular: AppTypography.title1Regular.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    title2Bold: AppTypography.title2Bold.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    title2Medium: AppTypography.title2Medium.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    title2Regular: AppTypography.title2Regular.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    title3Bold: AppTypography.title3Bold.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    title3Medium: AppTypography.title3Medium.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    title3Regular: AppTypography.title3Regular.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    heading1Bold: AppTypography.heading1Bold.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    heading1Medium: AppTypography.heading1Medium.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    heading1Regular: AppTypography.heading1Regular.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    heading2Bold: AppTypography.heading2Bold.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    heading2Medium: AppTypography.heading2Medium.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    heading2Regular: AppTypography.heading2Regular.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    headlineBold: AppTypography.headlineBold.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    headlineMedium: AppTypography.headlineMedium.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    headlineRegular: AppTypography.headlineRegular.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    bodyBold: AppTypography.bodyBold.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    bodyMedium: AppTypography.bodyMedium.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    bodyRegular: AppTypography.bodyRegular.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    labelBold: AppTypography.labelBold.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    labelMedium: AppTypography.labelMedium.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    labelRegular: AppTypography.labelRegular.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    captionBold: AppTypography.captionBold.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    captionMedium: AppTypography.captionMedium.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
    captionRegular: AppTypography.captionRegular.copyWith(
      color: _darkAppColors.labelNormal,
      decoration: TextDecoration.none,
    ),
  );

  static final _darkAppShadow = AppShadowExtension(
      black1: BoxShadow(
          color: _darkAppColors.elevationBlack1,
          offset: Offset(0, 3),
          blurRadius: 10.0),
      black2: BoxShadow(
          color: _darkAppColors.elevationBlack2,
          offset: Offset(0, 4),
          blurRadius: 12.0),
      black3: BoxShadow(
          color: _darkAppColors.elevationBlack3,
          offset: Offset(0, 6),
          blurRadius: 18.0),
      primary1: BoxShadow(
          color: _darkAppColors.elevationPrimary1,
          offset: Offset(0, 3),
          blurRadius: 10.0),
      primary2: BoxShadow(
          color: _darkAppColors.elevationPrimary2,
          offset: Offset(0, 4),
          blurRadius: 12.0),
      primary3: BoxShadow(
          color: _darkAppColors.elevationPrimary3,
          offset: Offset(0, 6),
          blurRadius: 18.0));
}

extension AppThemeExtension on ThemeData {
  /// Usage example: Theme.of(context).appColors;
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme._lightAppColors;

  AppTypographyExtension get appTypography =>
      extension<AppTypographyExtension>() ?? AppTheme._lightAppTypography;

  AppShadowExtension get appShadow =>
      extension<AppShadowExtension>() ?? AppTheme._lightAppShadow;
}

extension ThemeGetter on BuildContext {
  // Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);

  AppColorsExtension get colors => theme.appColors;
  AppTypographyExtension get typography => theme.appTypography;
  AppShadowExtension get shadow => theme.appShadow;
}
