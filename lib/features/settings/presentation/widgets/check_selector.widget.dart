import 'package:flutter/material.dart';

class CheckSelectorWidget extends StatelessWidget {
  const CheckSelectorWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String title;
  final bool value;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Checkbox(
          activeColor: Theme.of(context).colorScheme.primary,
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
