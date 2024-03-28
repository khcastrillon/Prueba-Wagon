import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String message) {
  print(message);
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
}
