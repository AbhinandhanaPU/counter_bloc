import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitialState(0)) {
    on<CounterIncrementEvent>(counterIncrementEvent);

    on<CounterDecrementEvent>(counterDecrementEvent);

    on<CounterResetEvent>(counterResetEvent);
  }

  FutureOr<void> counterIncrementEvent(
      CounterIncrementEvent event, Emitter<CounterState> emit) async {
    log('counter increment clicked');
    emit(CounterInitialState(state.count + 1));
  }

  FutureOr<void> counterDecrementEvent(
      CounterDecrementEvent event, Emitter<CounterState> emit) async {
    log('counter decrement clicked');
    emit(CounterInitialState(state.count - 1));
  }

  FutureOr<void> counterResetEvent(
      CounterResetEvent event, Emitter<CounterState> emit) async {
    log('counter reseted');
    emit(CounterInitialState(0));
  }
}
