import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  int counter = 0;

  void incrementCounter() {
    counter++;
    emit(counter);
  }

  void decrementCounter() {
    counter--;
    emit(counter);
  }
}