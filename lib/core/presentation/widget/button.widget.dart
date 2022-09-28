import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.label,
    this.icon,
    this.onPressed,
    this.expanded = false,
    this.color,
  }) : super(key: key);

  final String label;
  final IconData? icon;
  final Function()? onPressed;
  final bool expanded;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ButtonStyle style = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(color),
      fixedSize: MaterialStateProperty.all(
        expanded ? Size.fromWidth(size.width) : null,
      ),
    );
    if (icon != null) {
      return ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        style: style,
        label: Text(label.toUpperCase()),
      );
    }
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: Text(label.toUpperCase()),
    );
  }
}
