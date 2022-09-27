import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mangamaterial/core/localization/presentation/cubit/localization.cubit.dart';
import 'package:mangamaterial/core/localization/presentation/cubit/localization.cubit.state.dart';
import 'package:mangamaterial/core/navigation/app.router.gr.dart';
import 'package:mangamaterial/core/presentation/cubit/app_life_cycle_cubit.dart';
import 'package:mangamaterial/core/presentation/cubit/app_life_cycle_cubit.state.dart';
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

  runApp(
    AppCubitsProvider(
      initialLocale: initialLocale,
      builder: (BuildContext context) => const AppCubitsListener(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      BlocProvider.of<AppLifeCycleCubit>(context).enterBackground();
    }

    else if (state == AppLifecycleState.resumed) {
      BlocProvider.of<AppLifeCycleCubit>(context).enterForeground();
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Get router singleton
    final AppRouter appRouter = getIt<AppRouter>();

    /// Build material app
    return BlocBuilder<LocalizationCubit, CubitState>(
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
            return BlocListener<AppLifeCycleCubit, CubitState>(
              listener: (BuildContext context, CubitState state) {
                if (Platform.isAndroid && state is ForegroundState) {
                  final bool isDark =
                      SchedulerBinding.instance.window.platformBrightness ==
                          Brightness.dark;
                  AppThemeHelper.setAndroidSystemNavigationBar(isDark);
                }
              },
              child: child!,
            );
          },
        );
      },
    );
  }
}
