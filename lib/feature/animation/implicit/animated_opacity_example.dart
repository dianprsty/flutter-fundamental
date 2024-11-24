import 'package:flutter/material.dart';

class AnimatedOpacityExample extends StatefulWidget {
  const AnimatedOpacityExample({super.key});

  @override
  State<AnimatedOpacityExample> createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
  double opacity = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Opacity"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(seconds: 1),
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(child: Text("Opacity $opacity")),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  opacity = 1.0;
                });
              },
              child: const Text("Opacity 1.0"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  opacity = 0.5;
                });
              },
              child: const Text("Opacity 0.5"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  opacity = 0.0;
                });
              },
              child: const Text("Opacity 0"),
            ),
          ],
        ),
      ),
    );
  }
}
