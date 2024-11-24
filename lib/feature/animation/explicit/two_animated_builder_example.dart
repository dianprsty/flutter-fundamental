import 'package:flutter/material.dart';

class TwoAnimatedBuilderExample extends StatefulWidget {
  const TwoAnimatedBuilderExample({super.key});

  @override
  State<TwoAnimatedBuilderExample> createState() =>
      _TwoAnimatedBuilderExampleState();
}

class _TwoAnimatedBuilderExampleState extends State<TwoAnimatedBuilderExample>
    with TickerProviderStateMixin {
  late AnimationController _controller1; // Controller untuk animasi 1
  late AnimationController _controller2; // Controller untuk animasi 2

  // Animasi yang dibagi antara kedua builder
  late Animation<double> _sharedOpacityAnimation;

  // Animasi khusus untuk AnimatedBuilder pertama
  late Animation<double> _rotationAnimation1;
  late Animation<double> _scaleAnimation1;

  // Animasi khusus untuk AnimatedBuilder kedua
  late Animation<double> _rotationAnimation2;
  late Animation<Alignment> _alignmentAnimation2;

  @override
  void initState() {
    super.initState();

    // Controller pertama
    _controller1 = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Controller kedua
    _controller2 = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    // Shared opacity animation (dibagi di kedua builder)
    _sharedOpacityAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller1, curve: Curves.easeInOut));

    // AnimatedBuilder 1 animations
    _rotationAnimation1 = Tween<double>(
      begin: 0.0,
      end: 2 * 3.14159, // Rotasi penuh (360 derajat)
    ).animate(CurvedAnimation(parent: _controller1, curve: Curves.easeInOut));

    _scaleAnimation1 = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(CurvedAnimation(parent: _controller1, curve: Curves.easeInOut));

    // AnimatedBuilder 2 animations
    _rotationAnimation2 = Tween<double>(
      begin: 2 * 3.14159, // Mulai di rotasi penuh
      end: 0.0, // Kembali ke posisi awal
    ).animate(CurvedAnimation(parent: _controller2, curve: Curves.easeInOut));

    _alignmentAnimation2 = Tween<Alignment>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(CurvedAnimation(parent: _controller2, curve: Curves.easeInOut));

    // Mulai kedua animasi dengan pengulangan
    _controller1.repeat(reverse: true);
    _controller2.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Two Animation Controllers Example")),
      body: Stack(
        children: [
          // AnimatedBuilder pertama
          AnimatedBuilder(
            animation: _controller1,
            builder: (context, child) {
              return Center(
                child: Opacity(
                  opacity: _sharedOpacityAnimation.value,
                  child: Transform.rotate(
                    angle: _rotationAnimation1.value, // Rotasi animasi 1
                    child: Transform.scale(
                      scale: _scaleAnimation1.value, // Skala animasi 1
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          // AnimatedBuilder kedua
          AnimatedBuilder(
            animation: _controller2,
            builder: (context, child) {
              return Align(
                alignment: _alignmentAnimation2.value, // Posisi animasi 2
                child: Opacity(
                  opacity: _sharedOpacityAnimation.value, // Shared opacity
                  child: Transform.rotate(
                    angle: _rotationAnimation2.value, // Rotasi animasi 2
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
