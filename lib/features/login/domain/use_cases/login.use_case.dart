import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mangamaterial/core/errors/failure.dart';
import 'package:mangamaterial/features/login/domain/entities/user.entity.dart';
import 'package:mangamaterial/features/login/domain/repositories/login.repository.dart';

@singleton
class LoginUseCase {
  LoginUseCase(this.repository);

  final LoginRepository repository;

  Future<Either<Failure, UserEntity>> execute({
    required String email,
    required String password,
  }) async {
    return repository.login(email: email, password: password);
  }
}