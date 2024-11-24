import 'package:flutter/material.dart';

class PositionedTransitionExample extends StatefulWidget {
  const PositionedTransitionExample({super.key});

  @override
  State<PositionedTransitionExample> createState() =>
      _PositionedTransitionExampleState();
}

class _PositionedTransitionExampleState
    extends State<PositionedTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<RelativeRect> _positionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _positionAnimation = RelativeRectTween(
      begin: const RelativeRect.fromLTRB(0, 0, 300, 300),
      end: const RelativeRect.fromLTRB(300, 300, 0, 0),
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
      appBar: AppBar(title: const Text("Positioned Transition Example")),
      body: Stack(
        children: [
          PositionedTransition(
            rect: _positionAnimation,
            child: const Icon(Icons.circle, size: 50, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
