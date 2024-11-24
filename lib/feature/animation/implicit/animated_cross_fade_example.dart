import 'package:flutter/material.dart';

class AnimatedCrossFadeExample extends StatefulWidget {
  const AnimatedCrossFadeExample({super.key});

  @override
  State<AnimatedCrossFadeExample> createState() =>
      _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample> {
  bool showFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated CrossFade"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCrossFade(
              duration: const Duration(seconds: 1),
              firstCurve: Curves.easeInOut,
              firstChild: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text(
                  "First",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              secondChild: Container(
                width: 250,
                height: 200,
                color: Colors.green,
                alignment: Alignment.center,
                child: const Text(
                  "Second",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              crossFadeState: showFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showFirst = !showFirst;
                });
              },
              child: const Text("Toggle CrossFade"),
            ),
          ],
        ),
      ),
    );
  }
}
