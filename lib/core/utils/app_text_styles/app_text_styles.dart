import 'package:flutter/material.dart';

class AppTextStyles {
  final TextStyle displayLarge;
  final TextStyle displayMedium;
  final TextStyle displaySmall;
  final TextStyle headlineLarge;
  final TextStyle headlineMedium;
  final TextStyle headlineSmall;
  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;

  const AppTextStyles({
    required this.displayLarge,
    required this.displayMedium,
    required this.displaySmall,
    required this.headlineLarge,
    required this.headlineMedium,
    required this.headlineSmall,
    required this.titleLarge,
    required this.titleMedium,
    required this.titleSmall,
    required this.bodyLarge,
    required this.bodyMedium,
    required this.bodySmall,
    required this.labelLarge,
    required this.labelMedium,
    required this.labelSmall,
  });

  // إنشاء نسخة من الأنماط مع إمكانية التعديل
  AppTextStyles copyWith({
    TextStyle? displayLarge,
    TextStyle? displayMedium,
    TextStyle? displaySmall,
    TextStyle? headlineLarge,
    TextStyle? headlineMedium,
    TextStyle? headlineSmall,
    TextStyle? titleLarge,
    TextStyle? titleMedium,
    TextStyle? titleSmall,
    TextStyle? bodyLarge,
    TextStyle? bodyMedium,
    TextStyle? bodySmall,
    TextStyle? labelLarge,
    TextStyle? labelMedium,
    TextStyle? labelSmall,
  }) {
    return AppTextStyles(
      displayLarge: displayLarge ?? this.displayLarge,
      displayMedium: displayMedium ?? this.displayMedium,
      displaySmall: displaySmall ?? this.displaySmall,
      headlineLarge: headlineLarge ?? this.headlineLarge,
      headlineMedium: headlineMedium ?? this.headlineMedium,
      headlineSmall: headlineSmall ?? this.headlineSmall,
      titleLarge: titleLarge ?? this.titleLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      titleSmall: titleSmall ?? this.titleSmall,
      bodyLarge: bodyLarge ?? this.bodyLarge,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodySmall: bodySmall ?? this.bodySmall,
      labelLarge: labelLarge ?? this.labelLarge,
      labelMedium: labelMedium ?? this.labelMedium,
      labelSmall: labelSmall ?? this.labelSmall,
    );
  }

  // دمج الأنماط مع تعديلات
  AppTextStyles merge(AppTextStyles? other) {
    if (other == null) return this;

    return copyWith(
      displayLarge: displayLarge.merge(other.displayLarge),
      displayMedium: displayMedium.merge(other.displayMedium),
      displaySmall: displaySmall.merge(other.displaySmall),
      headlineLarge: headlineLarge.merge(other.headlineLarge),
      headlineMedium: headlineMedium.merge(other.headlineMedium),
      headlineSmall: headlineSmall.merge(other.headlineSmall),
      titleLarge: titleLarge.merge(other.titleLarge),
      titleMedium: titleMedium.merge(other.titleMedium),
      titleSmall: titleSmall.merge(other.titleSmall),
      bodyLarge: bodyLarge.merge(other.bodyLarge),
      bodyMedium: bodyMedium.merge(other.bodyMedium),
      bodySmall: bodySmall.merge(other.bodySmall),
      labelLarge: labelLarge.merge(other.labelLarge),
      labelMedium: labelMedium.merge(other.labelMedium),
      labelSmall: labelSmall.merge(other.labelSmall),
    );
  }

  // تحويل إلى TextTheme لاستخدامه في MaterialApp
  TextTheme toTextTheme() {
    return TextTheme(
      displayLarge: displayLarge,
      displayMedium: displayMedium,
      displaySmall: displaySmall,
      headlineLarge: headlineLarge,
      headlineMedium: headlineMedium,
      headlineSmall: headlineSmall,
      titleLarge: titleLarge,
      titleMedium: titleMedium,
      titleSmall: titleSmall,
      bodyLarge: bodyLarge,
      bodyMedium: bodyMedium,
      bodySmall: bodySmall,
      labelLarge: labelLarge,
      labelMedium: labelMedium,
      labelSmall: labelSmall,
    );
  }
}
