import 'package:flutter/material.dart';

class UsernameDecoration extends InputDecoration {
  const UsernameDecoration()
      : super(
            hintText: "Username",
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 5, color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ));
}

class PasswordDecoration extends InputDecoration {
  const PasswordDecoration({required Widget suffixIcon})
      : super(
          suffixIcon: suffixIcon,
          hintText: "Password",
          border: const OutlineInputBorder(
            borderSide: BorderSide(width: 5, color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        );
}

class SearchDecoration extends InputDecoration {
  const SearchDecoration()
      : super(
          prefixIcon: const Icon(Icons.search),
          hintText: "Search",
          contentPadding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        );
}
