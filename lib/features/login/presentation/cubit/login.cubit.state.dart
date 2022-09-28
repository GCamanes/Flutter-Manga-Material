import 'package:mangamaterial/core/errors/failure.dart';
import 'package:mangamaterial/core/presentation/cubit/custom.cubit.state.dart';
import 'package:mangamaterial/features/login/domain/entities/user.entity.dart';

class LoginLoadingState extends CubitState {}

class LoggedInState extends CubitState {
  LoggedInState(this.user);

  final UserEntity user;

  @override
  List<Object> get props => <Object>[
    ...props,
    user,
  ];
}

class LoggedOutState extends CubitState {
  LoggedOutState({this.failure});

  final Failure? failure;

  @override
  List<Object?> get props => <Object?>[
    ...props,
    failure,
  ];
}