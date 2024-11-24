import 'package:flutter/material.dart';

class DecoratedBoxTransitionExample extends StatefulWidget {
  const DecoratedBoxTransitionExample({super.key});

  @override
  State<DecoratedBoxTransitionExample> createState() =>
      _DecoratedBoxTransitionExampleState();
}

class _DecoratedBoxTransitionExampleState
    extends State<DecoratedBoxTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Decoration> _decorationAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _decorationAnimation = DecorationTween(
      begin: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.zero),
      end: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(30)),
    ).animate(_controller);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("DecoratedBox Transition Example")),
      body: Center(
        child: DecoratedBoxTransition(
          decoration: _decorationAnimation,
          child: const SizedBox(width: 100, height: 100),
        ),
      ),
    );
  }
}
