import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  const SliderExample({
    super.key,
  });

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _value = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Slider(
              value: _value,
              min: 0,
              max: 100,
              onChanged: (value) {
                setState(() {
                  _value = value.floor().toDouble();
                });
              }),
        ),
        Text(_value.toInt().toString())
      ],
    );
  }
}
