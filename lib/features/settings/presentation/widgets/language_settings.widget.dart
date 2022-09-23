import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangamaterial/core/extensions/context.extension.dart';
import 'package:mangamaterial/core/localization/presentation/cubit/localization.cubit.dart';
import 'package:mangamaterial/core/localization/presentation/cubit/localization.cubit.state.dart';
import 'package:mangamaterial/core/presentation/cubit/custom.cubit.state.dart';
import 'package:mangamaterial/features/settings/presentation/widgets/radio_selector.widget.dart';
import 'package:mangamaterial/features/settings/presentation/widgets/setting_element.widget.dart';
import 'package:mangamaterial/features/settings/presentation/widgets/settings_category.widget.dart';

class LanguageSettingsWidget extends StatelessWidget {
  const LanguageSettingsWidget({Key? key}) : super(key: key);

  Widget _buildSelector(
    BuildContext context,
    Locale locale,
    Locale currentLocale,
  ) {
    return SettingsElementWidget(
      rightPadding: false,
      child: RadioSelectorWidget<Locale>(
        title: context.getLocaleName(locale),
        value: locale,
        groupValue: currentLocale,
        onChanged: (Locale? newLocale) =>
            BlocProvider.of<LocalizationCubit>(context)
                .setLocale(newLocale!),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationCubit, CubitState>(
      builder: (BuildContext context, CubitState state) {
        return SettingsCategoryWidget(
          title: context.trad.languages,
          children: context.locales
              .map((Locale locale) => _buildSelector(
                    context,
                    locale,
                    (state as LocalizationState).locale,
                  ))
              .toList(),
        );
      },
    );
  }
}
