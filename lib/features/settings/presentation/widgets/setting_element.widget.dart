import 'package:flutter/material.dart';
import 'package:mangamaterial/core/utils/app.contants.dart';

class SettingsElementWidget extends StatelessWidget {
  const SettingsElementWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.settingsRowHeight,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppConstants.horizontalPadding,
          ),
          child: child,
        ),
      ),
    );
  }
}
