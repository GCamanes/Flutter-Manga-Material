import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mangamaterial/core/errors/failure.dart';
import 'package:mangamaterial/core/presentation/cubit/custom.cubit.dart';
import 'package:mangamaterial/core/presentation/cubit/custom.cubit.state.dart';
import 'package:mangamaterial/features/login/domain/entities/user.entity.dart';
import 'package:mangamaterial/features/login/domain/use_cases/get_current_user.use_case.dart';
import 'package:mangamaterial/features/login/domain/use_cases/login.use_case.dart';
import 'package:mangamaterial/features/login/domain/use_cases/logout.use_case.dart';
import 'package:mangamaterial/features/login/presentation/cubit/login.cubit.state.dart';

class LoginCubit extends CustomCubit<CubitState> {
  LoginCubit({
    required GetCurrentUserUseCase getCurrentUser,
    required LoginUseCase login,
    required LogoutUseCase logout,
  })  : _getCurrentUser = getCurrentUser,
        _login = login,
        _logout = logout,
        super(LoggedOutState()) {
    _streamSubscription = FirebaseAuth.instance
        .authStateChanges()
        .listen(_handleAuthStateChanges);
  }

  late StreamSubscription<User?> _streamSubscription;
  final GetCurrentUserUseCase _getCurrentUser;
  final LoginUseCase _login;
  final LogoutUseCase _logout;

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }

  void _handleAuthStateChanges(User? user) {
    if (user == null) {
      emit(LoggedOutState());
    }
  }

  Future<void> getCurrentUser() async {
    emit(LoginLoadingState());
    final Either<Failure, UserEntity> failureOrAppUser =
        await _getCurrentUser.execute();
    emit(_eitherSuccessOrErrorState(failureOrAppUser));
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    final Either<Failure, UserEntity> failureOrAppUser = await _login.execute(
      email: email,
      password: password,
    );
    emit(_eitherSuccessOrErrorState(failureOrAppUser));
  }

  void logoutUser() {
    _logout.execute();
  }

  CubitState _eitherSuccessOrErrorState(
    Either<Failure, UserEntity> failureOrAppUser,
  ) {
    return failureOrAppUser.fold(
      // if Left
      (Failure failure) => LoggedOutState(failure: failure),
      // if Right
      (UserEntity user) => LoggedInState(user),
    );
  }
}
