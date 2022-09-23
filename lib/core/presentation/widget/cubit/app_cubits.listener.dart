import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangamaterial/core/localization/presentation/cubit/localization.cubit.dart';
import 'package:mangamaterial/core/presentation/cubit/custom.cubit.dart';
import 'package:mangamaterial/core/presentation/cubit/custom.cubit.state.dart';

class AppCubitsListener extends StatelessWidget {
  const AppCubitsListener({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: <BlocListener<CustomCubit<CubitState>, CubitState>>[
        BlocListener<LocalizationCubit, CubitState>(
          listener: (BuildContext context, CubitState state) {
            log('LOCALE CHANGED');
          },
        )
      ],
      child: child,
    );
  }
}
