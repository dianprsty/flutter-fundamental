import 'package:flutter/material.dart';

class AnimatedAlignExample extends StatefulWidget {
  const AnimatedAlignExample({super.key});

  @override
  State<AnimatedAlignExample> createState() => _AnimatedAlignExampleState();
}

class _AnimatedAlignExampleState extends State<AnimatedAlignExample> {
  bool isAligned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Align"),
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isAligned = !isAligned;
          });
        },
        child: AnimatedAlign(
          alignment: isAligned ? Alignment.topRight : Alignment.bottomLeft,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: Container(
            width: 50,
            height: 50,
            color: Colors.orange,
          ),
        ),
      ),
    );
  }
}
