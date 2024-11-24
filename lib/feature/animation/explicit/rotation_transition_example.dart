import 'package:flutter/material.dart';

class RotationTransitionExample extends StatefulWidget {
  const RotationTransitionExample({super.key});

  @override
  State<RotationTransitionExample> createState() =>
      _RotationTransitionExampleState();
}

class _RotationTransitionExampleState extends State<RotationTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 1.0, end: 0).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rotation Transition Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: _animation,
              child: const Icon(Icons.sync, size: 100, color: Colors.blue),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
                onPressed: () {
                  _controller.stop();
                },
                child: Text(("stop"))),
            OutlinedButton(
                onPressed: () {
                  _controller.repeat();
                },
                child: Text(("play")))
          ],
        ),
      ),
    );
  }
}
