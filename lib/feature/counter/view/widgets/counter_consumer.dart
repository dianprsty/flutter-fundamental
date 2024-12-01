import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamental/feature/counter/bloc/counter_bloc.dart';
import 'package:flutter_fundamental/feature/counter/view/widgets/counter_buttons.dart';

class CounterConsumer extends StatelessWidget {
  const CounterConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter with BLoC')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterBloc, CounterState>(
            listener: (context, state) {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              if (state.value < 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Value is negative!')),
                );
              }
            },
            builder: (context, state) {
              return Center(
                child: Text(
                  'Current Value: ${state.value}',
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
