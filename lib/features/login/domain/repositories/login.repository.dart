import 'package:dartz/dartz.dart';
import 'package:mangamaterial/core/domain/repositories/main.repository.dart';
import 'package:mangamaterial/core/errors/failure.dart';
import 'package:mangamaterial/features/login/domain/entities/user.entity.dart';

abstract class LoginRepository extends MainRepository {
  Future<Either<Failure, UserEntity>> getCurrentUser();

  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, bool>> logout();
}