import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamental/core/widget/custom_text_field.dart';
import 'package:flutter_fundamental/core/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental/feature/auth/bloc/auth_bloc.dart';
import 'package:flutter_fundamental/feature/auth/login_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isSubmited = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
            controller: emailController,
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
            controller: passwordController,
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

              context.read<AuthBloc>().add(LoginEvent(
                  email: emailController.text,
                  password: passwordController.text));
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
