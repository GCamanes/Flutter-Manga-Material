import 'package:auto_route/annotations.dart';
import 'package:mangamaterial/features/home/presentation/pages/home.page.dart';
import 'package:mangamaterial/features/splashscreen/presentation/pages/splashscreen.page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashscreenPage, initial: true),
    AutoRoute(page: HomePage),
  ],
)

// extend the generated private router
class $AppRouter{}