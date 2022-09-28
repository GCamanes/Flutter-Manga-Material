import 'package:firebase_auth/firebase_auth.dart';
import 'package:mangamaterial/core/errors/failure.dart';

abstract class FailureHandler {
  static Failure handleFailure(dynamic error) {
    switch (error.runtimeType) {
      case FirebaseAuthException:
        final FirebaseException exception = (error as FirebaseException);
        return FirebaseAuthFailure(exception.code, exception.message ?? '');
      case FirebaseException:
        final FirebaseException exception = (error as FirebaseException);
        return FirebaseFailure(exception.code, exception.message ?? '');
      default:
        return UnknownErrorFailure(error.toString());
    }
  }
}
