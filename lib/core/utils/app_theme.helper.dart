import 'package:flutter/material.dart';
import 'package:mangamaterial/core/utils/app.colors.dart';

abstract class AppThemeHelper {
  // Light theme
  static ThemeData get getTheme => ThemeData(
        brightness: Brightness.light,
        primarySwatch: _generateMaterialColor(AppColors.primary),
        primaryColor: AppColors.primary,
      );

  // Dark theme
  static ThemeData get getDarkTheme => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: _generateMaterialColor(AppColors.primary),
        primaryColor: AppColors.primary,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
        ),
      );

  static MaterialColor _generateMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
