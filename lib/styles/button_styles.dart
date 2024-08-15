// TextButton.styleFrom(
//                 side: const BorderSide(color: Colors.grey, width: 1),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 minimumSize: const Size(600, 50),
//               ),

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
  PrimaryButtonStyle({double? radius, double? padding})
      : super(
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 10))),
          backgroundColor: WidgetStateProperty.all(Colors.blue.shade900),
          minimumSize: WidgetStateProperty.all(const Size(600, 50)),
          padding: WidgetStateProperty.all(
            padding == null ? EdgeInsets.zero : EdgeInsets.all(padding),
          ),
        );
}

// class CustomButtonStyle extends ButtonStyle {
//   final ButtonStyle style;

//   const CustomButtonStyle._(this.style);

//   factory CustomButtonStyle.primary() {
//     return CustomButtonStyle._(
//       ButtonStyle(
//         shape: WidgetStateProperty.all(
//           RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//         ),
//         backgroundColor: WidgetStateProperty.all(Colors.blue.shade900),
//         minimumSize: WidgetStateProperty.all(const Size(600, 50)),
//       ),
//     );
//   }

//   // Named constructor for a secondary button style
//   factory CustomButtonStyle.secondary() {
//     return CustomButtonStyle._(
//       ButtonStyle(
//         backgroundColor: WidgetStateProperty.all(Colors.green),
//         foregroundColor: WidgetStateProperty.all(Colors.black),
//         padding: WidgetStateProperty.all(
//             const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0)),
//         elevation: WidgetStateProperty.all(8.0),
//       ),
//     );
//   }
// }
