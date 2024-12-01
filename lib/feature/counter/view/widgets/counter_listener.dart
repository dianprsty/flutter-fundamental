import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamental/feature/counter/bloc/counter_bloc.dart';
import 'package:flutter_fundamental/feature/counter/view/widgets/counter_buttons.dart';

class CounterListener extends StatelessWidget {
  const CounterListener({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Listener')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocListener<CounterBloc, CounterState>(
            listener: (context, state) {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              if (state.value == 10) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('You reached 10!')),
                );
              }
            },
            child: Container(),
          ),
        ],
      ),
      floatingActionButton: const CounterButtons(),
    );
  }
}
