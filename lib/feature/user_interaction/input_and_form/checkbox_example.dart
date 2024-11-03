import 'package:flutter/material.dart';

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({
    super.key,
  });

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool isCheckboxListTileChecked = false;
  bool isCheckboxChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              value: isCheckboxChecked,
              onChanged: (value) {
                setState(() {
                  isCheckboxChecked = value!;
                });
                print(isCheckboxChecked);
              },
            ),
            Text('Setuju'),
          ],
        ),
        CheckboxListTile(
          title: Text(
            'Checkbox List Tile',
            style: TextStyle(
                decoration: isCheckboxListTileChecked
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          subtitle: Text('Sub Title'),
          value: isCheckboxListTileChecked,
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (value) {
            setState(() {
              isCheckboxListTileChecked = value!;
            });
          },
        ),
      ],
    );
  }
}
