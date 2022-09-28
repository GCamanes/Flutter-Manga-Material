import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mangamaterial/core/errors/failure.dart';
import 'package:mangamaterial/features/login/data/datasources/login.remote_datasource.dart';
import 'package:mangamaterial/features/login/domain/entities/user.entity.dart';
import 'package:mangamaterial/features/login/domain/repositories/login.repository.dart';

@Singleton(as: LoginRepository)
class LoginRepositoryImpl extends LoginRepository {
  LoginRepositoryImpl(this._dataSource);

  final LoginRemoteDataSource _dataSource;

  @override
  Future<Either<Failure, UserEntity>> getCurrentUser() async {
    final UserEntity user = _dataSource.getCurrentUser();
    if (user.success) {
      return Right<Failure, UserEntity>(user);
    }
    return const Left<Failure, UserEntity>(CacheFailure('no user'));
  }

  @override
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  }) async {
    if (email.isEmpty || password.isEmpty) {
      return const Left<Failure, UserEntity>(
          EmptyFieldFailure('field can\'t be empty'));
    }
    try {
      final UserEntity user =
          await _dataSource.login(email: email, password: password);
      return Right<Failure, UserEntity>(user);
    } catch (error) {
      return handleError<UserEntity>(error);
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      final bool result = await _dataSource.logout();
      return Right<Failure, bool>(result);
    } catch (error) {
      return handleError<bool>(error);
    }
  }
}
