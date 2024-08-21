import 'package:flutter/material.dart';

class UsernameDecoration extends InputDecoration {
  const UsernameDecoration()
      : super(
          hintText: "Username",
        );
}

class PasswordDecoration extends InputDecoration {
  const PasswordDecoration({required Widget suffixIcon})
      : super(
          suffixIcon: suffixIcon,
          hintText: "Password",
        );
}
