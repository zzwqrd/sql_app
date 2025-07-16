// امتداد على BuildContext
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_theme.dart';

extension AppThemeContext on BuildContext {
  AppTheme get appTheme {
    final theme = Theme.of(this);
    final brightness = theme.brightness;

    return brightness == Brightness.dark
        ? AppTheme.dark(this)
        : AppTheme.light(this);
  }

  AppColors get colors => appTheme.colors;
  // AppTextStyles get textStyles => appTheme.textStyles;

  // طرق مختصرة للوصول إلى الألوان الشائعة
  Color get primaryColor => colors.primary;
  Color get backgroundColor => colors.background;
  Color get textColor => colors.onBackground;
  Color get cardColor => colors.card;
  Color get dividerColor => colors.divider;
  Color get successColor => colors.success;
  Color get errorColor => colors.error;
  Color get warningColor => colors.warning;
  Color get infoColor => colors.info;
  Color get shadowColor => colors.shadow;
  Color get surfaceColor => colors.surface;
  Color get onSurfaceColor => colors.onSurface;
  Color get highlightColor => colors.highlight;
  Color get shimmerBaseColor => colors.shimmerBase;
  Color get shimmerHighlightColor => colors.shimmerHighlight;
  Color get inverseSurfaceColor => colors.inverseSurface;
  Color get onInverseSurfaceColor => colors.onInverseSurface;
  Color get outlineColor => colors.outline;
  Color get onPrimaryColor => colors.onPrimary;
  Color get onSecondaryColor => colors.onSecondary;
  Color get onTertiaryColor => colors.onTertiary;
  Color get onErrorColor => colors.onError;
  Color get onPrimaryContainerColor => colors.onPrimaryContainer;
  Color get onSecondaryContainerColor => colors.onSecondaryContainer;
  Color get onTertiaryContainerColor => colors.onTertiaryContainer;
  Color get onErrorContainerColor => colors.onErrorContainer;
  Color get surfaceVariantColor => colors.surfaceVariant;
  Color get onSurfaceVariantColor => colors.onSurfaceVariant;
}

// امتداد على Color
extension ColorExtensions on Color {
  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color withOpacity(double opacity) {
    return withOpacity(opacity.clamp(0.0, 1.0));
  }

  MaterialColor toMaterialColor() {
    return MaterialColor(value, {
      50: lighten(0.4),
      100: lighten(0.3),
      200: lighten(0.2),
      300: lighten(0.1),
      400: this,
      500: darken(0.1),
      600: darken(0.2),
      700: darken(0.3),
      800: darken(0.4),
      900: darken(0.5),
    });
  }
}
