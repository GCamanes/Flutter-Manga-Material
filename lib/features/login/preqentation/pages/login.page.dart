import 'package:flutter/material.dart';
import 'package:mangamaterial/core/extensions/context.extension.dart';
import 'package:mangamaterial/core/presentation/widget/text_field.widget.dart';
import 'package:mangamaterial/core/utils/app.contants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstants.horizontalPadding,
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 300),
                TextFieldWidget(
                  controller: _mailController,
                  label: context.trad.email,
                  icon: Icons.person,
                ),
                TextFieldWidget(
                  controller: _passwordController,
                  isObscure: true,
                  label: context.trad.password,
                  icon: Icons.lock,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
