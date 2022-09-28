import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.message);

  final String message;

  @override
  List<Object> get props => <Object>[
        ...props,
        message,
      ];
}

class EmptyFieldFailure extends Failure {
  const EmptyFieldFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  const CacheFailure(String message) : super(message);
}

class UnknownErrorFailure extends Failure {
  const UnknownErrorFailure(String message) : super(message);
}
