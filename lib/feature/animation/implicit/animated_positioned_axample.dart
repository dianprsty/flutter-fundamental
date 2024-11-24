import 'package:flutter/material.dart';

class AnimatedPositionedExample extends StatefulWidget {
  const AnimatedPositionedExample({super.key});

  @override
  State<AnimatedPositionedExample> createState() =>
      _AnimatedPositionedExampleState();
}

class _AnimatedPositionedExampleState extends State<AnimatedPositionedExample> {
  bool isMoved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Positioned"),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isMoved = !isMoved;
          });
        },
        child: Center(
          child: Container(
            height: 600,
            width: 350,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                  left: isMoved ? 200 : 50,
                  top: isMoved ? 400 : 100,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.cyan,
                  ),
                ),
                Positioned(
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.green,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
