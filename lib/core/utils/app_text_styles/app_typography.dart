import 'package:flutter/material.dart';

import 'app_text_styles.dart';

class AppTypography {
  // الأنماط الأساسية
  static AppTextStyles base(BuildContext context) {
    return AppTextStyles(
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );
  }

  // أنماط للوضع الفاتح
  static AppTextStyles light(BuildContext context) {
    return base(context).copyWith(
      // تعديلات خاصة بالوضع الفاتح
      displayLarge: base(context).displayLarge.copyWith(
            color: Colors.black87,
          ),
      bodyMedium: base(context).bodyMedium.copyWith(
            color: Colors.grey[800],
          ),
    );
  }

  // أنماط للوضع المظلم
  static AppTextStyles dark(BuildContext context) {
    return base(context).copyWith(
      // تعديلات خاصة بالوضع المظلم
      displayLarge: base(context).displayLarge.copyWith(
            color: Colors.white,
          ),
      bodyMedium: base(context).bodyMedium.copyWith(
            color: Colors.grey[300],
          ),
    );
  }

  // أنماط للعناوين فقط
  static AppTextStyles headings(BuildContext context) {
    return AppTextStyles(
      displayLarge: base(context).displayLarge,
      displayMedium: base(context).displayMedium,
      displaySmall: base(context).displaySmall,
      headlineLarge: base(context).headlineLarge,
      headlineMedium: base(context).headlineMedium,
      headlineSmall: base(context).headlineSmall,
      titleLarge: base(context).titleLarge,
      // بقية الأنماط تستخدم القيم الافتراضية
      titleMedium: base(context).titleMedium,
      titleSmall: base(context).titleSmall,
      bodyLarge: base(context).bodyLarge,
      bodyMedium: base(context).bodyMedium,
      bodySmall: base(context).bodySmall,
      labelLarge: base(context).labelLarge,
      labelMedium: base(context).labelMedium,
      labelSmall: base(context).labelSmall,
    );
  }

  // إنشاء أنماط مخصصة
  static AppTextStyles custom({
    required BuildContext context,
    Color? primaryColor,
    double? fontSizeFactor,
  }) {
    final baseStyles = base(context);

    return baseStyles.copyWith(
      displayLarge: baseStyles.displayLarge.copyWith(
        // fontFamily: fontFamily?.value,
        color: primaryColor,
        fontSize: baseStyles.displayLarge.fontSize! * (fontSizeFactor ?? 1.0),
      ),
      displayMedium: baseStyles.displayMedium.copyWith(
        // fontFamily: fontFamily?.value,
        color: primaryColor,
        fontSize: baseStyles.displayMedium.fontSize! * (fontSizeFactor ?? 1.0),
      ),
      displaySmall: baseStyles.displaySmall.copyWith(
        // fontFamily: fontFamily?.value,
        color: primaryColor,
        fontSize: baseStyles.displaySmall.fontSize! * (fontSizeFactor ?? 1.0),
      ),
      headlineLarge: baseStyles.headlineLarge.copyWith(
        // fontFamily: fontFamily?.value,
        color: primaryColor,
        fontSize: baseStyles.headlineLarge.fontSize! * (fontSizeFactor ?? 1.0),
      ),
    );
  }
}
