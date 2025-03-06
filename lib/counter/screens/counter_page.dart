import 'package:counter_bloc/counter/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  void initState() {
    counterBloc.add(CounterInitialEvent());
    super.initState();
  }

  final CounterBloc counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBloc, CounterState>(
      bloc: counterBloc,
      builder: (context, state) {
        switch (state.runtimeType) {
          case CounterLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case CounterInitialState:
            final countState = state as CounterInitialState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text('Counter App'),
              ),
              body: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    countState.count.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              )),
              floatingActionButton: Column(
                spacing: 5,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      counterBloc.add(CounterIncrementEvent());
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      counterBloc.add(CounterDecrementEvent());
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      counterBloc.add(CounterResetEvent());
                    },
                    tooltip: 'Reset',
                    child: const Icon(Icons.refresh),
                  ),
                ],
              ),
            );

          default:
            return SizedBox();
        }
      },
    );
  }
}
