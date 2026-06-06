import 'package:flutter_bloc/flutter_bloc.dart';

class RatingCubit extends Cubit<int> {
  RatingCubit() : super(0);
  // int saveStatus = 0;
  void setRating(int rating) {
    final updateState = rating + 1;
    emit(updateState);
  }

  void resetRating() {
    final updateState = 0;
    emit(updateState);
  }

  void saveRating() {
    //  final saveStatus = 1;
    //emit(saveStatus);

    final updateState = -1;
    emit(updateState);
  }

  void savedRating() {
    final updateState = -2;
    emit(updateState);
  }
}
