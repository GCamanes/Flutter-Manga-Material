import 'package:flutter/material.dart';
import 'package:mangamaterial/core/extensions/color.extension.dart';
import 'package:mangamaterial/core/utils/app.contants.dart';

class SettingsElementWidget extends StatelessWidget {
  const SettingsElementWidget({
    Key? key,
    required this.child,
    this.bottomBorder = true,
    this.rightPadding = true,
  }) : super(key: key);

  final Widget child;
  final bool bottomBorder;
  final bool rightPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppConstants.horizontalPadding,
      ),
      child: Container(
        height: AppConstants.settingsRowHeight,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(
          right: rightPadding ? AppConstants.horizontalPadding : 0,
        ),
        decoration: bottomBorder
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context)
                        .colorScheme
                        .onBackground
                        .emphasisDisabled,
                  ),
                ),
              )
            : null,
        child: child,
      ),
    );
  }
}
