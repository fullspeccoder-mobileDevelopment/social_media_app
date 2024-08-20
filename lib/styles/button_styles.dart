import 'package:flutter/material.dart';

///  Has to be used in a TextButton style attribute
//& TODO: Convert into class
ButtonStyle useGreyRoundedBorder() {
  return TextButton.styleFrom(
    side: const BorderSide(color: Colors.grey, width: 1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    minimumSize: const Size(600, 50),
  );
}

class PrimaryButtonStyle extends ButtonStyle {
  PrimaryButtonStyle()
      : super(backgroundColor: WidgetStateProperty.all(Colors.blue.shade900));
}
