import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangamaterial/core/navigation/app.router.dart';
import 'package:mangamaterial/core/navigation/app.router.gr.dart';
import 'package:mangamaterial/core/presentation/cubit/custom.cubit.state.dart';
import 'package:mangamaterial/core/presentation/widget/loader.widget.dart';
import 'package:mangamaterial/features/login/presentation/cubit/login.cubit.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SplashscreenPage extends StatefulWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  State<SplashscreenPage> createState() => _SplashscreenPageState();
}

class _SplashscreenPageState extends State<SplashscreenPage> {
  @override
  void initState() {
    BlocProvider.of<LoginCubit>(context).getCurrentUser();
    super.initState();
  }

  void _goToMainPage() {
    Future<void>.delayed(
      const Duration(seconds: 2),
      () => RouterHelper.router.replace(const MainRoute()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, CubitState>(
        listener: (BuildContext context, CubitState state) {
          _goToMainPage();
        },
        child: SafeArea(
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
      ),
    );
  }
}
