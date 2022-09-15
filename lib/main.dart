import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mangamaterial/core/navigation/app.router.gr.dart';
import 'package:mangamaterial/core/utils/app_theme.helper.dart';

void main() {
  runApp(const MyApp());
}

final AppRouter _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Manga Material',
      debugShowCheckedModeBanner: false,
      theme: AppThemeHelper.getTheme,
      darkTheme: AppThemeHelper.getDarkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
