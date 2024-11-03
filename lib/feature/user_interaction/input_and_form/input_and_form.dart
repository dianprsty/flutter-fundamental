import 'package:flutter/material.dart';
import 'package:flutter_fundamental/feature/user_interaction/input_and_form/checkbox_example.dart';
import 'package:flutter_fundamental/feature/user_interaction/input_and_form/dropdown_example.dart';
import 'package:flutter_fundamental/feature/user_interaction/input_and_form/radio_example.dart';
import 'package:flutter_fundamental/feature/user_interaction/input_and_form/slider_example.dart';
import 'package:flutter_fundamental/feature/user_interaction/input_and_form/switch_example.dart';

class InputAndForm extends StatelessWidget {
  const InputAndForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input & Form'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ListView(
            children: [
              const SizedBox(height: 30),
              TextField(
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus!.unfocus();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  labelText: 'Text Field',
                  // floatingLabelBehavior: FloatingLabelBehavior.auto,
                  hintText: 'Hint Text',
                  helper: const Text('This is text field helper'),
                  counterText: 'counter',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: const Icon(Icons.visibility_outlined),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus!.unfocus();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  labelText: 'Text Form Field',
                ),
              ),
              const SizedBox(height: 16),
              const CheckboxExample(),
              const RadioExample(),
              const SizedBox(height: 16),
              const DropdownExample(),
              const SwitchExample(),
              const SliderExample(),
            ],
          ),
        ),
      ),
    );
  }
}
