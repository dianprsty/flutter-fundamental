import 'package:flutter/material.dart';
import 'package:flutter_fundamental/feature/home/methods/button_nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Home Page'),
            buttonNav(context),
          ],
        ),
      ),
    );
  }
}
