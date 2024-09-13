import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Text that forms a sentence with a link to a different page
///
/// This is used to create a sentence with a link that will take you to a new page in the app using the primary text
/// as the beginning of the sentence and the secondary text as the actual link
///
/// The navigation method will take you to a new page in the application by touching the link
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
        const TextSpan(text: " "),
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
