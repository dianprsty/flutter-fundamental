import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamental/core/widget/custom_text_field.dart';
import 'package:flutter_fundamental/core/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental/feature/auth/bloc/auth_bloc.dart';
import 'package:flutter_fundamental/feature/main/main_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSubmited = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Authenticated) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const MainPage()));
        }
        if (state is AuthError) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: Form(
        autovalidateMode: _isSubmited
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              label: 'Email',
              controller: _emailController,
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
              controller: _passwordController,
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

                context.read<AuthBloc>().add(SignInRequested(
                    _emailController.text, _passwordController.text));
              },
              child: const Text(
                'Sign In',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
