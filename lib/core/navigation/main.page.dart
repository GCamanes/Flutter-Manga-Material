import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mangamaterial/core/extensions/context.extension.dart';
import 'package:mangamaterial/core/navigation/app.router.gr.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      animationDuration: Duration.zero,
      routes: const [
        HomeRoute(),
        FavoritesRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return BottomNavigationBar(
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: context.trad.home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              label: context.trad.favorites,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: context.trad.settings,
            ),
          ],
        );
      },
    );
  }
}
