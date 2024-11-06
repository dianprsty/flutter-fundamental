import 'dart:developer';

import 'package:flutter_fundamental/core/widget/custom_text_field.dart';
import 'package:flutter_fundamental/core/widget/primary_button.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSubmited = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: _isSubmited
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            label: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }

              if (value.length < 3) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          CustomTextField(
            label: 'Password',
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              log("Forgot password");
            },
            child: const Text(
              'Forgot Password?',
              style: TextStyle(fontSize: 12, color: Colors.blue),
              textAlign: TextAlign.end,
            ),
          ),
          const SizedBox(height: 40),
          PrimaryButton(
            onPressed: () {
              setState(() {
                _isSubmited = true;
              });
              if (!_formKey.currentState!.validate()) {
                return;
              }

              Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
            },
            child: const Text(
              'Sign In',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
