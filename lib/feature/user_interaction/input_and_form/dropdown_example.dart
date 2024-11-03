import 'package:flutter/material.dart';

List<String> dropDownMenu = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

class DropdownExample extends StatefulWidget {
  const DropdownExample({
    super.key,
  });

  @override
  State<DropdownExample> createState() => _DropdownExampleState();
}

class _DropdownExampleState extends State<DropdownExample> {
  String _value = dropDownMenu.first;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton(
        icon: const Icon(Icons.expand_more),
        underline: const SizedBox.shrink(),
        dropdownColor: Colors.white,
        isExpanded: true,
        value: _value,
        onChanged: (value) {
          setState(() {
            _value = value!;
          });
        },
        items: dropDownMenu
            .map(
              (value) => DropdownMenuItem(
                value: value,
                child: Text(value),
              ),
            )
            .toList(),
      ),
    );
  }
}
