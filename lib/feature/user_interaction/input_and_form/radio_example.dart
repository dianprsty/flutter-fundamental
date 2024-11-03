import 'package:flutter/material.dart';

enum ColorOptions { red, green, blue }

class RadioExample extends StatefulWidget {
  const RadioExample({
    super.key,
  });

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  int _radioValue = 0;
  ColorOptions _colorValue = ColorOptions.red;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            for (int i = 1; i <= 3; i++)
              Row(
                children: [
                  Radio(
                    value: i,
                    groupValue: _radioValue,
                    onChanged: (value) {
                      setState(() {
                        _radioValue = value!;
                      });
                      print(_radioValue);
                    },
                  ),
                  Text('Radio $i'),
                ],
              ),
          ],
        ),
        Text(ColorOptions.values.toString()),
        Column(
          children: ColorOptions.values.map((e) {
            return RadioListTile(
              value: e,
              title: Text(e.name),
              groupValue: _colorValue,
              onChanged: (ColorOptions? value) {
                setState(() {
                  _colorValue = value!;
                });
              },
            );
          }).toList(),
        )
      ],
    );
  }
}
