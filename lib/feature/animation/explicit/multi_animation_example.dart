import 'package:flutter/material.dart';

class MultiAnimationExample extends StatefulWidget {
  const MultiAnimationExample({super.key});

  @override
  State<MultiAnimationExample> createState() => _MultiAnimationExampleState();
}

class _MultiAnimationExampleState extends State<MultiAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Animasi multi properti
  late Animation<Color?> _colorAnimation;
  late Animation<Alignment> _alignmentAnimation;
  late Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    // Inisialisasi AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Animasi warna
    _colorAnimation = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Animasi alignment (posisi)
    _alignmentAnimation = Tween<Alignment>(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    // Animasi ukuran
    _sizeAnimation = Tween<double>(
      begin: 50.0,
      end: 150.0,
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
      appBar: AppBar(title: const Text("Multi Animation Example")),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Align(
            alignment: _alignmentAnimation.value,
            child: Container(
              width: _sizeAnimation.value,
              height: _sizeAnimation.value,
              decoration: BoxDecoration(
                color: _colorAnimation.value,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        },
      ),
    );
  }
}
