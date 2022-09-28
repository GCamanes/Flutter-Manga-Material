import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:mangamaterial/core/navigation/app.router.gr.dart';
import 'package:mangamaterial/core/presentation/cubit/custom.cubit.state.dart';
import 'package:mangamaterial/features/login/presentation/cubit/login.cubit.dart';
import 'package:mangamaterial/features/login/presentation/cubit/login.cubit.state.dart';

@singleton
class AuthGuard extends AutoRedirectGuard {
  AuthGuard(this._loginCubit) {
    _subscription = _loginCubit.stream.listen((CubitState state) async {
      if (state is LoggedOutState) {
        reevaluate();
      }
    });
  }

  final LoginCubit _loginCubit;
  late final StreamSubscription<CubitState> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Future<bool> canNavigate(RouteMatch route) async {
    return _loginCubit.state is LoggedInState;
  }

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    if (await canNavigate(resolver.route)) {
      resolver.next();
    } else {
      router.replaceAll(
        [const LoginRoute()],
      );
    }
  }
}
