import 'package:flutter/material.dart';

class AnimatedRotationExample extends StatefulWidget {
  const AnimatedRotationExample({super.key});

  @override
  State<AnimatedRotationExample> createState() =>
      _AnimatedRotationExampleState();
}

class _AnimatedRotationExampleState extends State<AnimatedRotationExample> {
  double turns = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Rotation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedRotation(
              turns: turns,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: Container(
                width: 10,
                height: 100,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  turns +=
                      1; // Memutar sebesar 90 derajat (0.25 dari satu putaran penuh)
                });
              },
              child: Text("Rotate"),
            ),
          ],
        ),
      ),
    );
  }
}
