part of 'counter_bloc.dart';

@immutable
abstract class CounterState {
  int get count;
}

class CounterInitialState extends CounterState {
  final int _count;

  CounterInitialState(this._count);

  @override
  int get count => _count;
}
