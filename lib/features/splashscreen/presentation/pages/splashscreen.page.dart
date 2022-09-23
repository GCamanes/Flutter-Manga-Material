import 'package:flutter/material.dart';
import 'package:mangamaterial/core/presentation/widget/loader.widget.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashscreenPage extends StatelessWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const Expanded(
              child: Center(child: LoaderWidget()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<PackageInfo> snapshot,
                ) {
                  if (snapshot.hasData) {
                    return Text(
                      snapshot.data?.version ?? '',
                      style: Theme.of(context).textTheme.subtitle2?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
