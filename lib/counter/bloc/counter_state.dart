// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitialState extends CounterState {
  final int count;

  CounterInitialState(this.count);
}

class CounterLoadingState extends CounterState {}

class CounterErrorState extends CounterState {
  final String message;

  CounterErrorState(this.message);
}
