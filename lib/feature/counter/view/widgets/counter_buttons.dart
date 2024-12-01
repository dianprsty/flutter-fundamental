import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamental/feature/counter/bloc/counter_bloc.dart';

class CounterButtons extends StatelessWidget {
  const CounterButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Menggunakan extension method untuk mengirim event
        FloatingActionButton(
          onPressed: () => context.read<CounterBloc>().add(Increment()),
          heroTag: 'increment',
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 10),
        FloatingActionButton(
          onPressed: () => context.read<CounterBloc>().add(Decrement()),
          heroTag: 'decrement',
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
