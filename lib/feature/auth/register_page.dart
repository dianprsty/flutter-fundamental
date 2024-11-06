import 'package:flutter_fundamental/feature/auth/widgets/navigation_text.dart';
import 'package:flutter_fundamental/feature/auth/widgets/register_form.dart';
import 'package:flutter_fundamental/feature/auth/widgets/separator.dart';
import 'package:flutter_fundamental/feature/auth/widgets/sign_in_with_google_button.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            const SizedBox(height: 70),
            const FlutterLogo(size: 100),
            const SizedBox(height: 40),
            const Text(
              "Let's Create An Account",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            const RegisterForm(),
            const SizedBox(height: 24),
            const Separator(),
            const SizedBox(height: 24),
            const SignInWithGoogleButton(text: 'Sign Up With Google'),
            const SizedBox(height: 40),
            NavigationText(
              register: true,
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            )
          ],
        ),
      ),
    );
  }
}
