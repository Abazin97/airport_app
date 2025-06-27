import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final String? Function(String?) validator;

  const CustomField({super.key, required this.hintText, required this.validator, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: validator,
    );
  }
}