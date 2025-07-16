import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppColorPalette {
  // لوحة الألوان الأساسية
  static AppColors base(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppColors(
      primary: const Color(0xFF006874),
      onPrimary: const Color(0xFFFFFFFF),
      primaryContainer: const Color(0xFF97F0FF),
      onPrimaryContainer: const Color(0xFF001F24),
      secondary: const Color(0xFF4A6267),
      onSecondary: const Color(0xFFFFFFFF),
      secondaryContainer: const Color(0xFFCDE7EC),
      onSecondaryContainer: const Color(0xFF051F23),
      tertiary: const Color(0xFF525E7D),
      onTertiary: const Color(0xFFFFFFFF),
      tertiaryContainer: const Color(0xFFDAE2FF),
      onTertiaryContainer: const Color(0xFF0E1B37),
      error: const Color(0xFFBA1A1A),
      onError: const Color(0xFFFFFFFF),
      errorContainer: const Color(0xFFFFDAD6),
      onErrorContainer: const Color(0xFF410002),
      background: isDark ? const Color(0xFF191C1D) : const Color(0xFFFAFDFD),
      onBackground: isDark ? const Color(0xFFE1E3E3) : const Color(0xFF191C1D),
      surface: isDark ? const Color(0xFF191C1D) : const Color(0xFFFAFDFD),
      onSurface: isDark ? const Color(0xFFE1E3E3) : const Color(0xFF191C1D),
      surfaceVariant:
          isDark ? const Color(0xFF3F484A) : const Color(0xFFDBE4E6),
      onSurfaceVariant:
          isDark ? const Color(0xFFBFC8CA) : const Color(0xFF3F484A),
      outline: isDark ? const Color(0xFF899294) : const Color(0xFF6F797A),
      shadow: isDark ? const Color(0xFF000000) : const Color(0xFF000000),
      inverseSurface:
          isDark ? const Color(0xFFE1E3E3) : const Color(0xFF2E3132),
      onInverseSurface:
          isDark ? const Color(0xFF191C1D) : const Color(0xFFF0F0F0),
      success: const Color(0xFF2E7D32),
      onSuccess: const Color(0xFFFFFFFF),
      warning: const Color(0xFFFFA000),
      onWarning: const Color(0xFF212121),
      info: const Color(0xFF0288D1),
      onInfo: const Color(0xFFFFFFFF),
      card: isDark ? const Color(0xFF1E2425) : const Color(0xFFFFFFFF),
      onCard: isDark ? const Color(0xFFE1E3E3) : const Color(0xFF191C1D),
      divider: isDark ? const Color(0xFF3F484A) : const Color(0xFFE0E0E0),
      highlight: isDark ? const Color(0x40FFFFFF) : const Color(0x66E3F2FD),
      shimmerBase: isDark ? const Color(0xFF2A2A2A) : const Color(0xFFE0E0E0),
      shimmerHighlight:
          isDark ? const Color(0xFF3A3A3A) : const Color(0xFFF5F5F5),
    );
  }

  // لوحة ألوان للوضع الفاتح
  static AppColors light(BuildContext context) {
    return base(context).copyWith(
      background: const Color(0xFFFAFDFD),
      onBackground: const Color(0xFF191C1D),
      surface: const Color(0xFFFAFDFD),
      onSurface: const Color(0xFF191C1D),
      card: const Color(0xFFFFFFFF),
      onCard: const Color(0xFF191C1D),
    );
  }

  // لوحة ألوان للوضع المظلم
  static AppColors dark(BuildContext context) {
    return base(context).copyWith(
      background: const Color(0xFF191C1D),
      onBackground: const Color(0xFFE1E3E3),
      surface: const Color(0xFF191C1D),
      onSurface: const Color(0xFFE1E3E3),
      card: const Color(0xFF1E2425),
      onCard: const Color(0xFFE1E3E3),
    );
  }

  // لوحة ألوان مخصصة
  static AppColors custom({
    required BuildContext context,
    required Color primary,
    required Color secondary,
    Brightness? brightness,
  }) {
    final baseColors = base(context);
    final isDark = brightness == Brightness.dark ||
        (brightness == null && Theme.of(context).brightness == Brightness.dark);

    return baseColors.copyWith(
      primary: primary,
      secondary: secondary,
      background: isDark ? const Color(0xFF121212) : const Color(0xFFFFFFFF),
      onBackground: isDark ? const Color(0xFFFFFFFF) : const Color(0xFF000000),
    );
  }
}
