import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  const LinkText({
    super.key,
    required this.primaryText,
    required this.secondaryText,
    required this.navigationMethod,
  });

  final String primaryText;
  final String secondaryText;
  final void Function()? navigationMethod;

  @override
  Widget build(BuildContext context) {
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
}
