import 'package:flutter/material.dart';
import 'package:mangamaterial/features/settings/presentation/widgets/setting_element.widget.dart';

class SettingsCategoryWidget extends StatelessWidget {
  const SettingsCategoryWidget({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SettingsElementWidget(
          child: Text(
            title,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        ...children,
      ],
    );
  }
}
