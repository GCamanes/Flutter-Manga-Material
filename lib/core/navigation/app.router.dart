import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mangamaterial/core/navigation/app.router.gr.dart';
import 'package:mangamaterial/core/navigation/main.page.dart';
import 'package:mangamaterial/features/favorites/presentation/pages/favorites.page.dart';
import 'package:mangamaterial/features/home/presentation/pages/home.page.dart';
import 'package:mangamaterial/features/login/preqentation/pages/login.page.dart';
import 'package:mangamaterial/features/settings/presentation/pages/settings.page.dart';
import 'package:mangamaterial/features/splashscreen/presentation/pages/splashscreen.page.dart';
import 'package:mangamaterial/get_it.injector.dart';

/// https://autoroute.vercel.app/advanced/bottom_navigation_bar_routing

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashscreenPage, initial: true),
    CustomRoute(
      page: LoginPage,
      transitionsBuilder: TransitionsBuilders.fadeIn,
    ),
    AutoRoute(
      path: '/',
      page: MainPage,
      children: [
        AutoRoute(
          path: 'home',
          page: HomePage,
        ),
        AutoRoute(
          path: 'favorites',
          page: FavoritesPage,
        ),
        AutoRoute(
          path: 'settings',
          page: SettingsPage,
        ),
      ],
    ),
  ],
)
// extend the generated private router
class $AppRouter {}

abstract class RouterHelper {
  static AppRouter get router => getIt<AppRouter>();
}
