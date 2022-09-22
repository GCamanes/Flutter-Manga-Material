import 'package:flutter/material.dart';
import 'package:mangamaterial/core/presentation/widget/loader.widget.dart';

class SplashscreenPage extends StatelessWidget {
  const SplashscreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:  LoaderWidget(),
      ),
    );
  }
}