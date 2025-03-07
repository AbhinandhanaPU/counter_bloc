part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterLoadingState extends CounterState {}

class CounterValueState extends CounterState {
  final int count;
  CounterValueState(this.count);
}

class CounterLimitReachedState extends CounterValueState {
  final String message;

  CounterLimitReachedState(super.count, this.message);
}
