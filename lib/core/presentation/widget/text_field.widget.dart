import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    Key? key,
    required this.controller,
    this.type,
    required this.label,
    this.icon,
    this.isObscure = false,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType? type;
  final String label;
  final IconData? icon;
  final bool isObscure;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late bool _obscured;

  @override
  void initState() {
    _obscured = widget.isObscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: _obscured,
      keyboardType: widget.type,
      decoration: InputDecoration(
        icon: Icon(widget.icon),
        labelText: widget.label,
        suffixIcon: IconButton(
          onPressed: () => setState(() {
            _obscured = !_obscured;
          }),
          icon: Icon(
            widget.isObscure
                ? (_obscured ? Icons.visibility_off : Icons.visibility)
                : null,
          ),
        ),
      ),
    );
  }
}
