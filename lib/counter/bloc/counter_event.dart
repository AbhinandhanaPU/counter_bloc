part of 'counter_bloc.dart';

abstract class CounterEvent {}

class CounterInitialEvent extends CounterEvent {}

class CounterIncrementEvent extends CounterEvent {}

class CounterDecrementEvent extends CounterEvent {}

class CounterResetEvent extends CounterEvent {}
