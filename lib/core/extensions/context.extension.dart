import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  Locale get currentLocale => Localizations.localeOf(this);

  List<Locale> get locales => AppLocalizations.supportedLocales;

  AppLocalizations get trad => AppLocalizations.of(this)!;

  String getLocaleName(Locale locale) {
    switch (locale.languageCode) {
      case 'fr':
        return trad.fr;
      default:
        return trad.en;
    }
  }
}