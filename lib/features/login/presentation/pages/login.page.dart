import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangamaterial/core/extensions/context.extension.dart';
import 'package:mangamaterial/core/navigation/app.router.dart';
import 'package:mangamaterial/core/navigation/app.router.gr.dart';
import 'package:mangamaterial/core/presentation/cubit/custom.cubit.state.dart';
import 'package:mangamaterial/core/presentation/widget/button.widget.dart';
import 'package:mangamaterial/core/presentation/widget/text_field.widget.dart';
import 'package:mangamaterial/core/utils/app.contants.dart';
import 'package:mangamaterial/features/login/presentation/cubit/login.cubit.dart';
import 'package:mangamaterial/features/login/presentation/cubit/login.cubit.state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late LoginCubit _loginCubit;

  @override
  void initState() {
    _loginCubit = BlocProvider.of<LoginCubit>(context);
    super.initState();
  }

  void _login() {
    _loginCubit.login(
      email: _mailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, CubitState>(
        listener: (context, state) {
          if (state is LoggedInState) {
            RouterHelper.router.replace(const MainRoute());
          }
        },
        builder: (context, state) {
          return GestureDetector(
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
                      type: TextInputType.emailAddress,
                      label: context.trad.email,
                      icon: Icons.person,
                    ),
                    TextFieldWidget(
                      controller: _passwordController,
                      isObscure: true,
                      label: context.trad.password,
                      icon: Icons.lock,
                    ),
                    const SizedBox(height: 50),
                    ButtonWidget(
                      label: context.trad.login,
                      icon: Icons.login,
                      onPressed: state is! LoginLoadingState ? _login : null,
                      expanded: true,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
