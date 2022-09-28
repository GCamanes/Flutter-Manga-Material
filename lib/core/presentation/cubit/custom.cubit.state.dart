import 'package:equatable/equatable.dart';
import 'package:mangamaterial/core/errors/failure.dart';

abstract class CubitState extends Equatable {
  final int privateTimeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => <Object>[
        privateTimeStamp,
      ];
}

class CubitInitState extends CubitState {}

class CubitErrorState extends CubitState {
  CubitErrorState(this.failure);

  final Failure failure;

  @override
  List<Object> get props => <Object>[
    ...props,
    failure,
  ];
}