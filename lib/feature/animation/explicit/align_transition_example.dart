import 'package:flutter/material.dart';

class AlignTransitionExample extends StatefulWidget {
  const AlignTransitionExample({super.key});

  @override
  State<AlignTransitionExample> createState() => _AlignTransitionExampleState();
}

class _AlignTransitionExampleState extends State<AlignTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _alignmentAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _alignmentAnimation = Tween<Alignment>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
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
      appBar: AppBar(title: const Text("Align Transition Example")),
      body: AlignTransition(
        alignment: _alignmentAnimation,
        child: const Icon(Icons.star, size: 50, color: Colors.orange),
      ),
    );
  }
}
