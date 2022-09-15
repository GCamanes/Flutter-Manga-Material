import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mangamaterial/core/navigation/app.router.gr.dart';
import 'package:mangamaterial/features/home/presentation/pages/home.page.dart';
import 'package:mangamaterial/features/splashscreen/presentation/pages/splashscreen.page.dart';
import 'package:mangamaterial/get_it.injector.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashscreenPage, initial: true),
    AutoRoute(page: HomePage),
  ],
)
// extend the generated private router
class $AppRouter {}

abstract class RouterHelper {
  static AppRouter get router => getIt<AppRouter>();
}
