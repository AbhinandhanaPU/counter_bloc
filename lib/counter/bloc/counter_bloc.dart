import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState(0)) {
    on<CounterInitialEvent>(counterInitialEvent);

    on<CounterIncrementEvent>(counterIncrementEvent);

    on<CounterDecrementEvent>(counterDecrementEvent);

    on<CounterResetEvent>(counterResetEvent);
  }
  FutureOr<void> counterInitialEvent(
      CounterInitialEvent event, Emitter<CounterState> emit) async {
    emit(CounterLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(CounterInitialState(0));
  }

  FutureOr<void> counterIncrementEvent(
      CounterIncrementEvent event, Emitter<CounterState> emit) async {
    log('counter increment clicked');
    final countState = state as CounterInitialState;
    emit(CounterInitialState(countState.count + 1));
  }

  FutureOr<void> counterDecrementEvent(
      CounterDecrementEvent event, Emitter<CounterState> emit) async {
    log('counter decrement clicked');
    final countState = state as CounterInitialState;

    // if (countState.count <= -5) {
    //   emit(CounterErrorState("Count cannot go below -5"));
    //   return;
    // }

    emit(CounterInitialState(countState.count - 1));
  }

  FutureOr<void> counterResetEvent(
      CounterResetEvent event, Emitter<CounterState> emit) async {
    log('counter reseted');
    emit(CounterInitialState(0));
  }
}
