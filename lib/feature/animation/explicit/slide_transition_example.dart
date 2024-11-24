import 'package:flutter/material.dart';

class SlideTransitionExample extends StatefulWidget {
  const SlideTransitionExample({super.key});

  @override
  State<SlideTransitionExample> createState() => _SlideTransitionExampleState();
}

class _SlideTransitionExampleState extends State<SlideTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(1, 0),
    ).animate(_controller);
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
      appBar: AppBar(title: const Text("Slide Transition Example")),
      body: Center(
        child: SlideTransition(
          position: _slideAnimation,
          child: const Icon(Icons.star, size: 50, color: Colors.orange),
        ),
      ),
    );
  }
}
