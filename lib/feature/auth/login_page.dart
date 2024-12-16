import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamental/feature/auth/bloc/auth_bloc.dart';
import 'package:flutter_fundamental/feature/auth/widgets/navigation_text.dart';
import 'package:flutter_fundamental/feature/auth/widgets/login_form.dart';
import 'package:flutter_fundamental/feature/auth/widgets/separator.dart';
import 'package:flutter_fundamental/feature/auth/widgets/sign_in_with_google_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess && state.user != null) {
            Navigator.pushReplacementNamed(context, '/');
          }

          if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ListView(
            children: [
              const SizedBox(height: 70),
              const FlutterLogo(size: 100),
              const SizedBox(height: 40),
              const Text(
                "Let's Sign You In",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              const LoginForm(),
              const SizedBox(height: 24),
              const Separator(),
              const SizedBox(height: 24),
              const SignInWithGoogleButton(text: 'Sign In With Google'),
              const SizedBox(height: 40),
              NavigationText(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/register');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
