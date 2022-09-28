import 'package:mangamaterial/core/presentation/cubit/custom.cubit.state.dart';

class BackgroundState extends CubitState {
  BackgroundState(this.since);

  final DateTime since;

  @override
  List<Object> get props => <Object>[
    ...props,
    since,
  ];
}

class ForegroundState extends CubitState {
  ForegroundState(this.backgroundTime);

  final Duration backgroundTime;

  @override
  List<Object> get props => <Object>[
    ...props,
    backgroundTime,
  ];
}