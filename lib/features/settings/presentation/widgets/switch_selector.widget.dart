import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchSelectorWidget extends StatelessWidget {
  const SwitchSelectorWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String title;
  final bool value;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Platform.isIOS
            ? CupertinoSwitch(
                value: value,
                onChanged: onChanged,
              )
            : Switch(
                activeColor: Theme.of(context).colorScheme.primary,
                value: value,
                onChanged: onChanged,
              ),
      ],
    );
  }
}
