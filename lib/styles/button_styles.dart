import 'package:flutter/material.dart';

class GreyRoundedBorder extends ButtonStyle {
  const GreyRoundedBorder()
      : super(
          side: const WidgetStatePropertyAll(
            BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
        );
}

class PrimaryButtonStyle extends ButtonStyle {
  PrimaryButtonStyle()
      : super(
          backgroundColor: WidgetStateProperty.all(Colors.blue.shade900),
        );
}
