import 'package:flutter/foundation.dart';
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

//& TODO: Will probably change into the default button style and may not need this style anymore
class PrimaryButtonStyle extends ButtonStyle {
  PrimaryButtonStyle({double? radius, double? padding, Size? size})
      : super(
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 10))),
          backgroundColor: WidgetStateProperty.all(Colors.blue.shade900),
          minimumSize: WidgetStateProperty.all(size ?? const Size(600, 50)),
          padding: WidgetStateProperty.all(
            padding == null ? EdgeInsets.zero : EdgeInsets.all(padding),
          ),
        );
}
