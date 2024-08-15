import 'package:flutter/material.dart';

///  Has to be used in a TextButton style attribute
ButtonStyle useGreyRoundedBorder() {
  return TextButton.styleFrom(
    side: const BorderSide(color: Colors.grey, width: 1),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    minimumSize: const Size(600, 50),
  );
}

/// Creates a divider
Divider useGreyDivider() {
  return const Divider(
    color: Colors.grey,
    thickness: 1,
  );
}

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
