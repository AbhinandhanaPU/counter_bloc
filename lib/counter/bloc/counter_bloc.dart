import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterLoadingState()) {
    on<CounterInitialEvent>(_counterInitialEvent);
    on<CounterIncrementEvent>(_counterIncrementEvent);
    on<CounterDecrementEvent>(_counterDecrementEvent);
    on<CounterResetEvent>(_counterResetEvent);
  }

  FutureOr<void> _counterInitialEvent(
      CounterInitialEvent event, Emitter<CounterState> emit) async {
    emit(CounterLoadingState());
    await Future.delayed(Duration(seconds: 2));
    emit(CounterValueState(0));
  }

  FutureOr<void> _counterIncrementEvent(
      CounterIncrementEvent event, Emitter<CounterState> emit) async {
    log('counter increment clicked');

    if (state is CounterValueState) {
      final currentState = state as CounterValueState;
      if (currentState.count < 5) {
        emit(CounterValueState(currentState.count + 1));
      } else {
        emit(CounterLimitReachedState(
            currentState.count, "Maximum limit reached!"));
      }
    }
  }

  FutureOr<void> _counterDecrementEvent(
      CounterDecrementEvent event, Emitter<CounterState> emit) async {
    log('counter decrement clicked');
    if (state is CounterValueState) {
      final currentState = state as CounterValueState;
      if (currentState.count > -5) {
        emit(CounterValueState(currentState.count - 1));
      } else {
        emit(CounterLimitReachedState(
            currentState.count, "Minimum limit reached!"));
      }
    }
  }

  FutureOr<void> _counterResetEvent(
      CounterResetEvent event, Emitter<CounterState> emit) async {
    emit(CounterValueState(0));
  }
}
