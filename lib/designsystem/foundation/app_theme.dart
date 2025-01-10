import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/foundation/app_palette.dart';

import 'app_colors_extension.dart';

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
    staticWhite: AppPalette.common00,
    staticBlack: AppPalette.common100,
    primaryNormal: AppPalette.blue50,
    primaryAlternative: AppPalette.blue50.withValues(alpha: 0.65),
    primaryAssistive: AppPalette.blue50.withValues(alpha: 0.20),
    statusNegative: AppPalette.red50,
    statusCautionary: AppPalette.yellow50,
    statusPositive: AppPalette.green50
  );

  //
  // Dark theme
  //

  static final dark = ThemeData.dark().copyWith(
    extensions: [
      _darkAppColors,
    ],
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
      staticWhite: AppPalette.common00,
      staticBlack: AppPalette.common100,
      primaryNormal: AppPalette.blue50,
      primaryAlternative: AppPalette.blue50.withValues(alpha: 0.65),
      primaryAssistive: AppPalette.blue50.withValues(alpha: 0.20),
      statusNegative: AppPalette.red50,
      statusCautionary: AppPalette.yellow50,
      statusPositive: AppPalette.green50
  );
}

extension AppThemeExtension on ThemeData {
  /// Usage example: Theme.of(context).appColors;
  AppColorsExtension get appColors =>
      extension<AppColorsExtension>() ?? AppTheme._lightAppColors;
}

extension ThemeGetter on BuildContext {
  // Usage example: `context.theme`
  ThemeData get theme => Theme.of(this);
}