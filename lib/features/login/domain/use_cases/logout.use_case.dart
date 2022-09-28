import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:mangamaterial/core/errors/failure.dart';
import 'package:mangamaterial/features/login/domain/repositories/login.repository.dart';

@singleton
class LogoutUseCase {
  LogoutUseCase(this.repository);

  final LoginRepository repository;

  Future<Either<Failure, bool>> execute() async {
    return repository.logout();
  }
}