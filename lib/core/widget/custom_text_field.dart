import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final bool obscureText;
  final GlobalKey<FormState>? formKey;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final int minLines;
  final int maxLines;
  const CustomTextField({
    super.key,
    required this.label,
    this.obscureText = false,
    this.validator,
    this.formKey,
    this.controller,
    this.minLines = 1,
    this.maxLines = 1,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;

  _showOrHide() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: widget.minLines,
      maxLines:
          widget.maxLines < widget.minLines ? widget.minLines : widget.maxLines,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.obscureText && !isVisible,
      decoration: InputDecoration(
        suffixIcon: widget.obscureText
            ? GestureDetector(
                onTap: _showOrHide,
                child: Icon(isVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined),
              )
            : null,
        isDense: true,
        labelText: widget.label,
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Colors.blue.shade300),
        ),
      ),
    );
  }
}
