import 'package:flutter/material.dart';
import 'package:mangamaterial/core/extensions/color.extension.dart';
import 'package:mangamaterial/core/utils/app.colors.dart';

/// See https://material.io/design/color/dark-theme.html

abstract class AppThemeHelper {
  // Light theme
  static ThemeData get getTheme => ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primary.material.shade500,
          primaryContainer: AppColors.primary.material.shade700,
          secondary: AppColors.secondary.material.shade200,
          secondaryContainer: AppColors.secondary.material.shade900,
          background: AppColors.white,
          surface: AppColors.white,
          error: AppColors.error,
          onPrimary: AppColors.white,
          onSecondary: AppColors.black,
          onBackground: AppColors.black.emphasisMedium,
          onSurface: AppColors.black.emphasisHigh,
          onError: AppColors.white,
        ),
      );

  // Dark theme
  static ThemeData get getDarkTheme => ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: AppColors.primary.material.shade200,
          primaryContainer: AppColors.primary.material.shade700,
          secondary: AppColors.secondary.material.shade200,
          secondaryContainer: AppColors.secondary.material.shade900,
          background: AppColors.background,
          surface: AppColors.surface,
          error: AppColors.errorDark,
          onPrimary: AppColors.black,
          onSecondary: AppColors.black,
          onBackground: AppColors.white.emphasisMedium,
          onSurface: AppColors.white.emphasisHigh,
          onError: AppColors.black,
        ),
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(color: AppColors.surface),
      );
}
