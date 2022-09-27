import 'package:flutter/material.dart';

class RadioSelectorWidget<T> extends StatelessWidget {
  const RadioSelectorWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  final String title;
  final T value;
  final T groupValue;
  final Function(T?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Radio(
          activeColor: Theme.of(context).colorScheme.primary,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
