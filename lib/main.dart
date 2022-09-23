import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mangamaterial/core/navigation/app.router.gr.dart';
import 'package:mangamaterial/core/utils/app_theme.helper.dart';
import 'package:mangamaterial/get_it.injector.dart';

Future<void> _initApp() async {
  /// Register AppRouter singleton (navigating without context available)
  getIt.registerSingleton<AppRouter>(AppRouter());
}

void main() async {
  await _initApp();

  WidgetsFlutterBinding.ensureInitialized();
  /// Force portrait orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = getIt<AppRouter>();
    return MaterialApp.router(
      title: 'Manga Material',
      debugShowCheckedModeBanner: false,
      theme: AppThemeHelper.getTheme,
      darkTheme: AppThemeHelper.getDarkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
    );
  }
}
