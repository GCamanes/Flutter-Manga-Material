import 'dart:ui';

import 'package:mangamaterial/core/presentation/cubit/custom.cubit.state.dart';

class LocalizationState extends CubitState {
  LocalizationState(this.locale);

  final Locale locale;

  @override
  List<Object> get props => <Object>[
    ...props,
    locale,
  ];
}