import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangamaterial/core/extensions/context.extension.dart';
import 'package:mangamaterial/core/localization/presentation/cubit/localization.cubit.dart';
import 'package:mangamaterial/core/presentation/cubit/custom.cubit.state.dart';
import 'package:mangamaterial/features/settings/presentation/widgets/setting_element.widget.dart';
import 'package:mangamaterial/features/settings/presentation/widgets/settings_category.widget.dart';
import 'package:mangamaterial/features/settings/presentation/widgets/switch_selector.widget.dart';

class AuthorizationSettingsWidget extends StatefulWidget {
  const AuthorizationSettingsWidget({Key? key}) : super(key: key);

  @override
  State<AuthorizationSettingsWidget> createState() =>
      _AuthorizationSettingsWidgetState();
}

class _AuthorizationSettingsWidgetState
    extends State<AuthorizationSettingsWidget> {
  bool _tracking = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, CubitState>(
      builder: (BuildContext context, CubitState state) {
        return SettingsCategoryWidget(
          title: context.trad.authorization,
          children: <Widget>[
            SettingsElementWidget(
              rightPadding: Platform.isIOS,
              child: SwitchSelectorWidget(
                title: context.trad.dataTracking,
                value: _tracking,
                onChanged: (bool value) => setState(() {
                  _tracking = value;
                }),
              ),
            ),
          ],
        );
      },
    );
  }
}
