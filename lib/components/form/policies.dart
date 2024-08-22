import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Contains links to the terms & conditions page along with the privacy policy page
class PoliciesText extends StatelessWidget {
  const PoliciesText({super.key});

  @override
  Widget build(BuildContext context) {
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
}
