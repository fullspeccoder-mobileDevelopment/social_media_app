import 'package:flutter/material.dart';

InputDecoration? generateUsernameDecoration() {
  return const InputDecoration(
    hintText: "Username",
    border: OutlineInputBorder(
      borderSide: BorderSide(width: 5, color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );
}

InputDecoration? generatePasswordDecoration(Widget? suffixIcon) {
  return InputDecoration(
    suffixIcon: suffixIcon,
    hintText: "Password",
    border: const OutlineInputBorder(
      borderSide: BorderSide(width: 5, color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
  );
}
