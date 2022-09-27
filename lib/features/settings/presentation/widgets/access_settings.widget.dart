import 'package:flutter/material.dart';
import 'package:mangamaterial/core/extensions/context.extension.dart';
import 'package:mangamaterial/features/settings/presentation/widgets/check_selector.widget.dart';
import 'package:mangamaterial/features/settings/presentation/widgets/setting_element.widget.dart';
import 'package:mangamaterial/features/settings/presentation/widgets/settings_category.widget.dart';

class AccessSettingsWidget extends StatefulWidget {
  const AccessSettingsWidget({Key? key}) : super(key: key);

  @override
  State<AccessSettingsWidget> createState() => _AccessSettingsWidgetState();
}

class _AccessSettingsWidgetState extends State<AccessSettingsWidget> {
  bool _locationAccess = false;
  bool _microphoneAccess = false;

  @override
  Widget build(BuildContext context) {
    return SettingsCategoryWidget(
      title: context.trad.access,
      children: <Widget>[
        SettingsElementWidget(
          rightPadding: false,
          child: CheckSelectorWidget(
            title: context.trad.location,
            value: _locationAccess,
            onChanged: (bool? value) => setState(() {
              _locationAccess = value!;
            }),
          ),
        ),
        SettingsElementWidget(
          rightPadding: false,
          child: CheckSelectorWidget(
            title: context.trad.microphone,
            value: _microphoneAccess,
            onChanged: (bool? value) => setState(() {
              _microphoneAccess = value!;
            }),
          ),
        ),
      ],
    );
  }
}
