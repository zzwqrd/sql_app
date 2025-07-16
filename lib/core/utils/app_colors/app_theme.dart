import 'package:flutter/material.dart';

import '../app_text_styles/app_text_styles.dart';
import '../app_text_styles/app_typography.dart';
import 'app_color_palette.dart';
import 'app_colors.dart';

class AppTheme {
  final AppColors colors;
  final AppTextStyles textStyles;

  const AppTheme({
    required this.colors,
    required this.textStyles,
  });

  // ثيم للوضع الفاتح
  static AppTheme light(BuildContext context) {
    return AppTheme(
      colors: AppColorPalette.light(context),
      textStyles: AppTypography.light(context),
    );
  }

  // ثيم للوضع المظلم
  static AppTheme dark(BuildContext context) {
    return AppTheme(
      colors: AppColorPalette.dark(context),
      textStyles: AppTypography.dark(context),
    );
  }

  // ثيم مخصص
  static AppTheme custom({
    required BuildContext context,
    required Color primary,
    required Color secondary,
    Brightness? brightness,
    String? fontFamily,
  }) {
    return AppTheme(
      colors: AppColorPalette.custom(
        context: context,
        primary: primary,
        secondary: secondary,
        brightness: brightness,
      ),
      textStyles: AppTypography.custom(
        context: context,
        primaryColor: primary,
      ),
    );
  }

  // تحويل إلى ThemeData لاستخدامه في MaterialApp
  ThemeData toThemeData() {
    return ThemeData(
      colorScheme: colors.toColorScheme(),
      textTheme: textStyles.toTextTheme(),
      scaffoldBackgroundColor: colors.background,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        elevation: 0,
      ),
      cardTheme: CardTheme(
        color: colors.card,
        elevation: 1,
        margin: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: colors.divider,
        thickness: 1,
        space: 1,
      ),
      // يمكن إضافة المزيد من التخصيصات هنا
    );
  }
}
