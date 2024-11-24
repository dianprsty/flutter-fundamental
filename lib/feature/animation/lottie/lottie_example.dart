import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieExample extends StatefulWidget {
  const LottieExample({super.key});

  @override
  State<LottieExample> createState() => _LottieExampleState();
}

class _LottieExampleState extends State<LottieExample>
    with TickerProviderStateMixin {
  late AnimationController _loadingController;
  late AnimationController _complexController;

  @override
  void initState() {
    super.initState();
    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );

    _loadingController.repeat();

    _complexController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );

    _complexController.repeat();
  }

  @override
  void dispose() {
    _loadingController.dispose();
    _complexController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lottie Example')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/lotties/lottie-1.json',
              width: 200,
              height: 200,
              fit: BoxFit.fill,
              controller: _complexController),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: () => _complexController.stop(),
                  child: const Text("Pause")),
              const SizedBox(
                width: 16,
              ),
              OutlinedButton(
                  onPressed: () => _complexController.repeat(),
                  child: const Text("Play")),
            ],
          ),
          Lottie.asset('assets/lotties/lottie-2.json',
              width: 200,
              height: 200,
              fit: BoxFit.fill,
              controller: _loadingController),
        ],
      ),
    );
  }
}
