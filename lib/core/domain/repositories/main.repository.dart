import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:mangamaterial/core/errors/failure.dart';
import 'package:mangamaterial/core/errors/failure.handler.dart';

abstract class MainRepository {
  Either<Failure, T> handleError<T>(dynamic error) {
    log('HANDLED ERROR $error');
    /// TODO: add a failure handler
    return Left<Failure, T>(FailureHandler.handleFailure(error));
  }
}