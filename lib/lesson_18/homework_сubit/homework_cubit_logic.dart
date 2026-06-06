import 'package:flutter_bloc/flutter_bloc.dart';

class HWCubitLogic extends Cubit<int> {
  HWCubitLogic() : super(0);
  void increment() {
    final updateState = state + 2;
    emit(updateState);
  }

  void decrement() {
    final updateState = state - 2;
    emit(updateState);
  }
}
