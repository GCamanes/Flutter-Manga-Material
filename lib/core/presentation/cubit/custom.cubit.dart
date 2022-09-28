import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CustomCubit<State> extends Cubit<State> {
  CustomCubit(State state) : super(state);

  @override
  void emit(State state) {
    if (!isClosed) {
      String str = 'EVENT $runtimeType -- ${state.toString()}';
      log(str);
      super.emit(state);
    }
  }

  @override
  Future<void> close() async {
    super.close();
  }
}