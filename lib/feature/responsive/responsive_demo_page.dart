import 'package:flutter/material.dart';
import 'package:flutter_fundamental/feature/responsive/responsive_mobile.dart';
import 'package:flutter_fundamental/feature/responsive/responsive_tablet.dart';
import 'package:flutter_fundamental/feature/responsive/responsive_wrapper.dart';

class ResponsiveDemoPage extends StatelessWidget {
  const ResponsiveDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWrapper(
      mobileBody: ResponsiveMobile(),
      tabletBody: ResponsiveTablet(),
    );
  }
}
