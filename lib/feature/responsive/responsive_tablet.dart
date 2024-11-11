import 'package:flutter/material.dart';
import 'package:flutter_fundamental/feature/responsive/widgets/login_widget.dart';

class ResponsiveTablet extends StatelessWidget {
  const ResponsiveTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              child: const FlutterLogo(
                size: 200,
              ),
            ),
          ),
          const SizedBox(
            width: 350,
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: LoginWidget()),
            ),
          ),
        ],
      ),
    );
  }
}
