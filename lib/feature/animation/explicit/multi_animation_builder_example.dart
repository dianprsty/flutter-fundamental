import 'package:flutter/material.dart';

class MultiAnimationBuilderExample extends StatefulWidget {
  const MultiAnimationBuilderExample({super.key});

  @override
  State<MultiAnimationBuilderExample> createState() =>
      _MultiAnimationBuilderExampleState();
}

class _MultiAnimationBuilderExampleState
    extends State<MultiAnimationBuilderExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Animasi multi properti
  late Animation<double> _rotationAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Inisialisasi AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Animasi rotasi
    _rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 2 * 3.14159, // Rotasi 360 derajat (dalam radian)
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Animasi skala
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Animasi opacity
    _opacityAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Mulai animasi dengan pengulangan
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Multi Animation Builder Example")),
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          builder: (context, child) {
            return Transform.rotate(
              angle: _rotationAnimation.value, // Rotasi animasi
              child: Transform.scale(
                scale: _scaleAnimation.value, // Skala animasi
                child: Opacity(
                  opacity: _opacityAnimation.value, // Opacity animasi
                  child: child,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
