import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangamaterial/core/extensions/context.extension.dart';
import 'package:mangamaterial/core/presentation/widget/button.widget.dart';
import 'package:mangamaterial/core/utils/app.contants.dart';
import 'package:mangamaterial/features/login/presentation/cubit/login.cubit.dart';
import 'package:mangamaterial/features/settings/presentation/widgets/access_settings.widget.dart';
import 'package:mangamaterial/features/settings/presentation/widgets/authorization_settings.widget.dart';
import 'package:mangamaterial/features/settings/presentation/widgets/language_settings.widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(context.trad.settings)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const LanguageSettingsWidget(),
            const SizedBox(height: AppConstants.settingsSpacingHeight),
            const AuthorizationSettingsWidget(),
            const SizedBox(height: AppConstants.settingsSpacingHeight),
            const AccessSettingsWidget(),
            const SizedBox(height: AppConstants.settingsSpacingHeight * 2),
            ButtonWidget(
              label: context.trad.logout,
              color: Theme.of(context).colorScheme.error,
              onPressed: () => BlocProvider.of<LoginCubit>(context).logout(),
            ),
          ],
        ),
      ),
    );
  }
}
