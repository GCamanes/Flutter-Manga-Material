import 'package:flutter/material.dart';
import 'package:mangamaterial/core/extensions/context.extension.dart';
import 'package:mangamaterial/core/utils/app.contants.dart';
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
          children: const <Widget>[
            LanguageSettingsWidget(),
            SizedBox(height: AppConstants.settingsSpacingHeight),
            AuthorizationSettingsWidget(),
            SizedBox(height: AppConstants.settingsSpacingHeight),
            AccessSettingsWidget(),
          ],
        ),
      ),
    );
  }
}
