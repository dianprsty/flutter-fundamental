import 'package:flutter/material.dart';

ElevatedButton buttonNav(BuildContext context) {
  return ElevatedButton(
      onPressed: () {
        // Navigator.pop(context);
        Navigator.pushNamed(context, '/saved');
      },
      child: const Text('Go to Saved'));
}
