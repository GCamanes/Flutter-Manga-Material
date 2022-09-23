import 'package:flutter/material.dart';
import 'package:mangamaterial/core/extensions/context.extension.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.trad.favorites)),
    );
  }
}
