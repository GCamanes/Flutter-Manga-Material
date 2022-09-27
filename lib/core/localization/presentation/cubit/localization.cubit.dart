import 'dart:ui';

import 'package:mangamaterial/core/localization/presentation/cubit/localization.cubit.state.dart';
import 'package:mangamaterial/core/presentation/cubit/custom.cubit.dart';
import 'package:mangamaterial/core/presentation/cubit/custom.cubit.state.dart';

class LocalizationCubit extends CustomCubit<CubitState> {
  LocalizationCubit(Locale locale) : super(LocalizationState(locale));

  Future<void> setLocale(Locale newLocale) async {
    emit(LocalizationState(newLocale));
  }
}
