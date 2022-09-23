import 'package:equatable/equatable.dart';

abstract class CubitState extends Equatable {
  final int privateTimeStamp = DateTime.now().millisecondsSinceEpoch;

  @override
  List<Object> get props => <Object>[
        privateTimeStamp,
      ];
}

class CubitInitState extends CubitState {}
