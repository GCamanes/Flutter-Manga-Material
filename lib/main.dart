import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mangamaterial/core/localization/presentation/cubit/localization.cubit.dart';
import 'package:mangamaterial/core/localization/presentation/cubit/localization.cubit.state.dart';
import 'package:mangamaterial/core/navigation/app.router.gr.dart';
import 'package:mangamaterial/core/presentation/cubit/custom.cubit.state.dart';
import 'package:mangamaterial/core/presentation/widget/cubit/app_cubits.listener.dart';
import 'package:mangamaterial/core/presentation/widget/cubit/app_cubits.provider.dart';
import 'package:mangamaterial/core/utils/app_theme.helper.dart';
import 'package:mangamaterial/get_it.injector.dart';

late Locale initialLocale;

Future<void> _initApp() async {
  /// Register AppRouter singleton (navigating without context available)
  getIt.registerSingleton<AppRouter>(AppRouter());

  /// TODO: use local storage to init locale later
  String defaultLocaleName = Platform.localeName;
  if (defaultLocaleName.contains('_')) {
    defaultLocaleName = defaultLocaleName.split('_').first;
  }
  initialLocale = Locale(defaultLocaleName);

  WidgetsFlutterBinding.ensureInitialized();
  /// Force portrait orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

void main() async {
  await _initApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Get router singleton
    final AppRouter appRouter = getIt<AppRouter>();

    /// Build material app
    return AppCubitsProvider(
      initialLocale: initialLocale,
      builder: (BuildContext context) => AppCubitsListener(
        child: BlocBuilder<LocalizationCubit, CubitState>(
          builder: (BuildContext context, CubitState state) {
            return MaterialApp.router(
              title: 'Manga Material',
              debugShowCheckedModeBanner: false,
              theme: AppThemeHelper.getTheme,
              darkTheme: AppThemeHelper.getDarkTheme,
              locale: (state as LocalizationState).locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerDelegate: appRouter.delegate(),
              routeInformationParser: appRouter.defaultRouteParser(),
              builder: (BuildContext context, Widget? child) {
                return child!;
              },
            );
          },
        ),
      ),
    );
  }
}
