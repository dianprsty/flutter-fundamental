import 'package:flutter_fundamental/core/widget/custom_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fundamental/feature/auth/bloc/auth_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInWithGoogleButton extends StatelessWidget {
  final String text;
  const SignInWithGoogleButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      onPressed: () {
        context.read<AuthBloc>().add(GoogleSignInRequested());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/google-logo.png', width: 16),
            const SizedBox(width: 16),
            Text(
              text,
              // style: TextStyle(fontSize: 13, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
