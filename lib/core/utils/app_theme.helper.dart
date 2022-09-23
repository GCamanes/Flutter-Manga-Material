import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mangamaterial/core/extensions/color.extension.dart';
import 'package:mangamaterial/core/utils/app.colors.dart';

/// Colors: https://material.io/design/color/dark-theme.html
/// Text: https://material.io/design/typography/the-type-system.html

abstract class AppThemeHelper {
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
        textTheme: textTheme(),
      );

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
        textTheme: textTheme(),
      );

  static void setAndroidSystemNavigationBar(bool isDark) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor:
            isDark ? AppColors.surface : AppColors.white,
        systemNavigationBarDividerColor:
            isDark ? AppColors.white : AppColors.black,
        systemNavigationBarIconBrightness:
            isDark ? Brightness.light : Brightness.dark,
      ),
    );
  }

  static TextTheme textTheme() => const TextTheme(
        headline1: TextStyle(
          fontSize: 96,
          letterSpacing: -1.5,
          fontFamily: 'robotoLight',
        ),
        headline2: TextStyle(
          fontSize: 60,
          letterSpacing: -.5,
          fontFamily: 'robotoLight',
        ),
        headline3: TextStyle(
          fontSize: 48,
          letterSpacing: 0,
          fontFamily: 'robotoRegular',
        ),
        headline4: TextStyle(
          fontSize: 34,
          letterSpacing: -0.25,
          fontFamily: 'robotoRegular',
        ),
        headline5: TextStyle(
          fontSize: 24,
          fontFamily: 'robotoRegular',
        ),
        headline6: TextStyle(
          fontSize: 20,
          letterSpacing: 0.15,
          fontFamily: 'robotoMedium',
        ),
        subtitle1: TextStyle(
          fontSize: 16,
          letterSpacing: 0.15,
          fontFamily: 'robotoRegular',
        ),
        subtitle2: TextStyle(
          fontSize: 14,
          letterSpacing: 0.1,
          fontFamily: 'robotoMedium',
        ),
        bodyText1: TextStyle(
          fontSize: 16,
          letterSpacing: 0.5,
          fontFamily: 'robotoRegular',
        ),
        bodyText2: TextStyle(
          fontSize: 14,
          letterSpacing: 0.25,
          fontFamily: 'robotoRegular',
        ),
        button: TextStyle(
          fontSize: 14,
          letterSpacing: 1.25,
          fontFamily: 'robotoMedium',
        ),
        caption: TextStyle(
          fontSize: 12,
          letterSpacing: 0.4,
          fontFamily: 'robotoRegular',
        ),
        overline: TextStyle(
          fontSize: 10,
          letterSpacing: 1.5,
          fontFamily: 'robotoRegular',
        ),
      );
}
