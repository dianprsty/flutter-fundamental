import 'package:flutter/material.dart';

class AnimatedDefaultTextStyleExample extends StatefulWidget {
  const AnimatedDefaultTextStyleExample({super.key});

  @override
  State<AnimatedDefaultTextStyleExample> createState() =>
      _AnimatedDefaultTextStyleExampleState();
}

class _AnimatedDefaultTextStyleExampleState
    extends State<AnimatedDefaultTextStyleExample> {
  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedDefaultTextStyle"),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isChanged = !isChanged;
          });
        },
        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: const Duration(seconds: 1),
            style: isChanged
                ? const TextStyle(
                    fontSize: 40,
                    color: Colors.red,
                    fontWeight: FontWeight.bold)
                : const TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontWeight: FontWeight.normal),
            child: const Text("Hello Flutter!"),
          ),
        ),
      ),
    );
  }
}
