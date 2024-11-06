import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NavigationText extends StatelessWidget {
  final bool? register;
  final void Function()? onTap;
  const NavigationText({
    super.key,
    this.onTap,
    this.register = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: register!
                ? "Already have an account? "
                : "Don't have an account? ",
          ),
          TextSpan(
            text: register! ? 'Sign In' : 'Sign Up',
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          )
        ],
      ),
      textAlign: TextAlign.center,
      style: const TextStyle(fontSize: 13),
    );
  }
}
