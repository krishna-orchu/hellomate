import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final Icon icon;
  final bool obscure;
  const AuthTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    required this.obscure
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16)
        )
      ),
      obscureText: obscure,
    );
  }
}
