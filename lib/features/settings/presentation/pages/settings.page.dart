import 'package:flutter/material.dart';
import 'package:mangamaterial/core/extensions/context.extension.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.trad.settings)),
    );
  }
}
