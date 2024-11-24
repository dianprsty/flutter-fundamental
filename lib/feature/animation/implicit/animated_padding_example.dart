import 'package:flutter/material.dart';

class AnimatedPaddingExample extends StatefulWidget {
  const AnimatedPaddingExample({super.key});

  @override
  State<AnimatedPaddingExample> createState() => _AnimatedPaddingExampleState();
}

class _AnimatedPaddingExampleState extends State<AnimatedPaddingExample> {
  double paddingValue = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Padding"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              paddingValue = paddingValue == 10.0 ? 60.0 : 10.0;
            });
          },
          child: Container(
            height: 200,
            width: 200,
            color: Colors.blue,
            child: AnimatedPadding(
              padding: EdgeInsets.all(paddingValue),
              duration: Duration(seconds: 1),
              curve: Curves.linear,
              child: Container(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
