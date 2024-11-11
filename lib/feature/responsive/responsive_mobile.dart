import 'package:flutter/material.dart';
import 'package:flutter_fundamental/feature/responsive/widgets/login_widget.dart';

class ResponsiveMobile extends StatelessWidget {
  const ResponsiveMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: 100),
            SizedBox(height: 40),
            LoginWidget(),
          ],
        ),
      ),
    );
  }
}
