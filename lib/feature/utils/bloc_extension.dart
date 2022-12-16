// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:bloc/bloc.dart';

extension BlockUtils<T> on BlocBase<T> {
  void emitOneShot(T oneShotState) {
    final currentState = state;
    emit(oneShotState);
    emit(currentState);
  }
}
