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
