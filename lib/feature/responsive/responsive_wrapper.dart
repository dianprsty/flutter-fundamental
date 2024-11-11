import 'package:flutter/material.dart';

class ResponsiveWrapper extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;

  const ResponsiveWrapper(
      {super.key, required this.mobileBody, required this.tabletBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 700) {
          return mobileBody;
        } else {
          return tabletBody;
        }
      },
    );
  }
}
