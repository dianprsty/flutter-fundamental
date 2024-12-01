import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamental/feature/counter/bloc/counter_bloc.dart';
import 'package:flutter_fundamental/feature/counter/view/widgets/counter_buttons.dart';

class CounterBuilder extends StatelessWidget {
  const CounterBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter with BLoC')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Center(
                child: Text(
                  'Counter Value: ${state.value}',
                  style: const TextStyle(fontSize: 24),
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
