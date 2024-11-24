import 'package:flutter/material.dart';

class SizeTransitionExample extends StatefulWidget {
  const SizeTransitionExample({super.key});

  @override
  State<SizeTransitionExample> createState() => _SizeTransitionExampleState();
}

class _SizeTransitionExampleState extends State<SizeTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _sizeAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(_controller);
    _controller.repeat();
    // _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Size Transition Example")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              alignment: Alignment.bottomCenter,
              height: 300,
              width: 50,
              child: SizeTransition(
                sizeFactor: _sizeAnimation,
                child: Container(width: 50, height: 300, color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
