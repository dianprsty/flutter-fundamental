import 'package:flutter/material.dart';

class TweenAnimationBuilderSizeExample extends StatefulWidget {
  const TweenAnimationBuilderSizeExample({super.key});

  @override
  State<TweenAnimationBuilderSizeExample> createState() =>
      _TweenAnimationBuilderSizeExampleState();
}

class _TweenAnimationBuilderSizeExampleState
    extends State<TweenAnimationBuilderSizeExample> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tween Animation Builder Size"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: TweenAnimationBuilder<double>(
            curve: Curves.easeInOut,
            tween: Tween<double>(begin: 100.0, end: isExpanded ? 200.0 : 100.0),
            duration: const Duration(seconds: 1),
            builder: (context, value, child) {
              return Container(
                width: value,
                height: value,
                color: Colors.green,
              );
            },
          ),
        ),
      ),
    );
  }
}
