import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hintText;
  final TextEditingController textController;
  final bool isPassword;
  const AuthField(
      {super.key,
      required this.hintText,
      required this.textController,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return '$hintText es requerido';
        }
        return null;
      },
      obscureText: isPassword,
    );
  }
}
