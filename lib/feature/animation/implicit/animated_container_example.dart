import 'package:flutter/material.dart';

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(isExpanded ? 0 : 16),
            alignment: isExpanded ? Alignment.center : Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: isExpanded ? Colors.blue : Colors.green,
              borderRadius: BorderRadius.circular(isExpanded ? 20 : 10),
            ),
            width: isExpanded ? 200 : 100,
            height: isExpanded ? 200 : 100,
            child: const Text(
              "Animated Container",
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
