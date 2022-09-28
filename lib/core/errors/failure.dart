import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.message);

  final String message;

  @override
  List<Object> get props => <Object>[
        message,
      ];
}

class NoFailure extends Failure {
  const NoFailure() : super('');
}

class EmptyFieldFailure extends Failure {
  const EmptyFieldFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

class FirebaseFailure extends Failure {
  const FirebaseFailure(this.code, String message) : super(message);

  final String code;
}

class FirebaseAuthFailure extends Failure {
  const FirebaseAuthFailure(this.code, String message) : super(message);

  final String code;
}

class UnknownErrorFailure extends Failure {
  const UnknownErrorFailure(String message) : super(message);
}
