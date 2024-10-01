import 'package:flutter/material.dart';

class EmailDecoration extends InputDecoration {
  const EmailDecoration()
      : super(
          hintText: "Email",
        );
}

class PasswordDecoration extends InputDecoration {
  const PasswordDecoration({required Widget suffixIcon})
      : super(
          suffixIcon: suffixIcon,
          hintText: "Password",
        );
}
