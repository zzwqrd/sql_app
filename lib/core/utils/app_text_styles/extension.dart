// امتداد على BuildContext
import 'package:flutter/material.dart';

import 'app_text_styles.dart';
import 'app_typography.dart';

extension AppTextThemeExtension on BuildContext {
  AppTextStyles get appTextStyles {
    final theme = Theme.of(this);
    final brightness = theme.brightness;

    return brightness == Brightness.dark
        ? AppTypography.dark(this)
        : AppTypography.light(this);
  }

  TextStyle get displayLarge => appTextStyles.displayLarge;
  TextStyle get displayMedium => appTextStyles.displayMedium;
  TextStyle get displaySmall => appTextStyles.displaySmall;
  TextStyle get headlineLarge => appTextStyles.headlineLarge;
  TextStyle get headlineMedium => appTextStyles.headlineMedium;
  TextStyle get headlineSmall => appTextStyles.headlineSmall;
  TextStyle get titleLarge => appTextStyles.titleLarge;
  TextStyle get titleMedium => appTextStyles.titleMedium;
  TextStyle get titleSmall => appTextStyles.titleSmall;
  TextStyle get bodyLarge => appTextStyles.bodyLarge;
  TextStyle get bodyMedium => appTextStyles.bodyMedium;
  TextStyle get bodySmall => appTextStyles.bodySmall;
  TextStyle get labelLarge => appTextStyles.labelLarge;
  TextStyle get labelMedium => appTextStyles.labelMedium;
  TextStyle get labelSmall => appTextStyles.labelSmall;
}

// امتداد على TextStyle
extension TextStyleExtensions on TextStyle {
  TextStyle withColor(Color color) => copyWith(color: color);

  TextStyle withWeight(FontWeight weight) => copyWith(fontWeight: weight);

  TextStyle withSize(double size) => copyWith(fontSize: size);

  TextStyle withFontFamily(String family) => copyWith(fontFamily: family);

  TextStyle italic() => copyWith(fontStyle: FontStyle.italic);

  TextStyle underline() => copyWith(decoration: TextDecoration.underline);

  TextStyle letterSpacing(double spacing) => copyWith(letterSpacing: spacing);

  TextStyle height(double lineHeight) => copyWith(height: lineHeight);
}
