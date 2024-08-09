import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Function used to return widget with complex policies text
Widget generatePoliciesHyperText(BuildContext context) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(children: [
      const TextSpan(
        text: "By continuing, you accept our standard ",
        style: TextStyle(
          color: Color.fromRGBO(29, 29, 29, 0.75),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      TextSpan(
        text: "terms & conditions",
        style: const TextStyle(
          decoration: TextDecoration.underline,
          color: Color.fromRGBO(29, 29, 29, 0.75),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Navigator.popAndPushNamed(context, "/home");
          },
      ),
      const TextSpan(
        text: " and our ",
        style: TextStyle(
          color: Color.fromRGBO(29, 29, 29, 0.75),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
      TextSpan(
        text: "privacy policy",
        style: const TextStyle(
          decoration: TextDecoration.underline,
          color: Color.fromRGBO(29, 29, 29, 0.75),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Navigator.popAndPushNamed(context, "/home");
          },
      ),
      const TextSpan(text: "."),
    ]),
  );
}

/// Used to generate a line of text with one hyper link
///
/// primary text - text used for first part of the whole text
/// secondary text - text used for the actual link
/// navigation method - function used to change pages
Widget generateLinkText(
  BuildContext context, {
  required String primaryText,
  required String secondaryText,
  required void Function()? navigationMethod,
}) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(children: [
      TextSpan(
        text: primaryText,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      TextSpan(
        text: secondaryText,
        style: const TextStyle(
          decoration: TextDecoration.underline,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(215, 48, 48, 1),
        ),
        recognizer: TapGestureRecognizer()..onTap = navigationMethod,
      ),
    ]),
  );
}

// Function used for the navigationMethod
// void Function()? {
//   Navigator.of(context).push(
//       MaterialPageRoute(builder: (_) => const LogIn()));
// }
