import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  Locale get currentLocale => Localizations.localeOf(this);

  AppLocalizations get trad => AppLocalizations.of(this)!;
}