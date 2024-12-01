import 'package:flutter/material.dart';
import 'package:flutter_fundamental/feature/counter/view/widgets/counter_builder.dart';
import 'package:flutter_fundamental/feature/counter/view/widgets/counter_consumer.dart';
import 'package:flutter_fundamental/feature/counter/view/widgets/counter_listener.dart';
import 'package:flutter_fundamental/feature/counter/view/widgets/counter_selector.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter with BLoC')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CounterBuilder()));
              },
              child: const Text("Counter Builder"),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CounterSelector(),
                    ),
                  );
                },
                child: const Text("Counter Selector")),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CounterListener(),
                  ),
                );
              },
              child: const Text("Counter Listener"),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CounterConsumer(),
                  ),
                );
              },
              child: const Text("Counter Consumer"),
            ),
          ],
        ),
      ),
    );
  }
}
