import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  const BottomNavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isActive ? Colors.yellow : Colors.white,
        ),
        Text(
          label,
          style: TextStyle(color: isActive ? Colors.yellow : Colors.white),
        ),
      ],
    );
  }
}
