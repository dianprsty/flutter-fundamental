import 'package:flutter/material.dart';
import 'package:flutter_fundamental/feature/auth/widgets/login_form.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Selamat Datang',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 32),
        LoginForm(),
      ],
    );
  }
}
