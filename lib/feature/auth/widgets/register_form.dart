import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_fundamental/core/widget/custom_text_field.dart';
import 'package:flutter_fundamental/core/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental/feature/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isSubmited = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
            controller: _nameController,
            label: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }

              return null;
            },
          ),
          const SizedBox(height: 24),
          CustomTextField(
            controller: _emailController,
            label: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }

              return null;
            },
          ),
          const SizedBox(height: 24),
          CustomTextField(
            controller: _passwordController,
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
          const SizedBox(height: 40),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is Authenticated) {
                Navigator.pushReplacementNamed(context, '/');
              }

              if (state is AuthError) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            child: PrimaryButton(
              onPressed: () async {
                setState(() {
                  _isSubmited = true;
                });
                if (!_formKey.currentState!.validate()) {
                  return;
                }

                try {
                  context.read<AuthBloc>().add(SignUpRequested(
                      _emailController.text, _passwordController.text));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
