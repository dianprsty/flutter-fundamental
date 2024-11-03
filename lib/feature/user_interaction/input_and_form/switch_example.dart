import 'package:flutter/material.dart';

class SwitchExample extends StatefulWidget {
  const SwitchExample({
    super.key,
  });

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool _isOn = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _isOn,
      onChanged: (value) {
        setState(() {
          _isOn = value;
        });
        print(_isOn);
      },
    );
  }
}
