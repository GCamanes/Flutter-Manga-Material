import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mangamaterial/core/extensions/context.extension.dart';
import 'package:mangamaterial/core/localization/presentation/cubit/localization.cubit.dart';
import 'package:mangamaterial/core/presentation/cubit/app_life_cycle_cubit.dart';
import 'package:mangamaterial/core/presentation/cubit/custom.cubit.dart';
import 'package:mangamaterial/core/presentation/cubit/custom.cubit.state.dart';
import 'package:mangamaterial/features/login/presentation/cubit/login.cubit.dart';
import 'package:mangamaterial/get_it.injector.dart';

class AppCubitsProvider extends StatelessWidget {
  const AppCubitsProvider({
    Key? key,
    required this.builder,
    this.initialLocale,
  }) : super(key: key);

  final WidgetBuilder builder;
  final Locale? initialLocale;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<CustomCubit<CubitState>>>[
        BlocProvider<AppLifeCycleCubit>(
          create: (context) => AppLifeCycleCubit(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(
            getCurrentUser: getIt(),
            login: getIt(),
            logout: getIt(),
          ),
        ),
        BlocProvider<LocalizationCubit>(
          create: (context) => LocalizationCubit(
            initialLocale ?? context.locales.first,
          ),
        ),
      ],
      child: builder(context),
    );
  }
}
