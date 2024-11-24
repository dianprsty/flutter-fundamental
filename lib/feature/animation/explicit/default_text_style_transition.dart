import 'package:flutter/material.dart';

class DefaultTextStyleTransitionExample extends StatefulWidget {
  const DefaultTextStyleTransitionExample({super.key});

  @override
  State<DefaultTextStyleTransitionExample> createState() =>
      _DefaultTextStyleTransitionExampleState();
}

class _DefaultTextStyleTransitionExampleState
    extends State<DefaultTextStyleTransitionExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<TextStyle> _textStyleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _textStyleAnimation = TextStyleTween(
      begin: const TextStyle(fontSize: 20, color: Colors.blue),
      end: const TextStyle(
          fontSize: 40, color: Colors.red, fontWeight: FontWeight.bold),
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
      appBar: AppBar(title: const Text("Default Text Style Transition")),
      body: Center(
        child: DefaultTextStyleTransition(
          style: _textStyleAnimation,
          child: const Text("Flutter Animation"),
        ),
      ),
    );
  }
}
