import 'package:flutter/material.dart';

class AnimatedSizeExample extends StatefulWidget {
  const AnimatedSizeExample({super.key});

  @override
  State<AnimatedSizeExample> createState() => _AnimatedSizeExampleState();
}

class _AnimatedSizeExampleState extends State<AnimatedSizeExample>
    with TickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Size"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            color: Colors.orange,
            padding: EdgeInsets.all(16),
            child: AnimatedSize(
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              reverseDuration: Duration(seconds: 1),
              child: Container(
                width: !isExpanded ? 300 : 100,
                height: !isExpanded ? 300 : 100,
                color: Colors.blue,
                child: Text(
                  "Animated Size",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
