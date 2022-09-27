import 'package:flutter/material.dart';
import 'package:mangamaterial/core/extensions/context.extension.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.trad.home)),
    );
  }
}
