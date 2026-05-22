import 'package:flutter_bloc/flutter_bloc.dart';

class HomeworkBlocLogic extends Bloc<HomeworkEvent, int> {
  HomeworkBlocLogic() : super(1) {
    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrement);
  }

  void _increment(IncrementEvent event, Emitter<int> emit) {
    final updatestate = state + 1;
    emit(updatestate);
  }

  void _decrement(DecrementEvent event, Emitter<int> emit) {
    final updatestate = state - 1;
    emit(updatestate);
  }
}

class DecrementEvent extends HomeworkEvent {}

class IncrementEvent extends HomeworkEvent {}

class HomeworkEvent {}
