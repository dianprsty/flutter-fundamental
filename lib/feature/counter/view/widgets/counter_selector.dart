import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamental/feature/counter/bloc/counter_bloc.dart';
import 'package:flutter_fundamental/feature/counter/view/widgets/counter_buttons.dart';

class CounterSelector extends StatelessWidget {
  const CounterSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter with BLoC')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocSelector<CounterBloc, CounterState, bool>(
            selector: (state) => state.value % 2 == 0,
            builder: (context, isEven) {
              return Center(
                child: Text(
                  isEven ? 'Even' : 'Odd',
                  style: const TextStyle(fontSize: 18),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: const CounterButtons(),
    );
  }
}
