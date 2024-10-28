import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final List<Widget> menus;
  final void Function(int index) onTap;
  const BottomNavBar({super.key, required this.menus, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: menus
            .map((e) => GestureDetector(
                  onTap: () => onTap(menus.indexOf(e)),
                  child: e,
                ))
            .toList(),
      ),
    );
  }
}
