import 'package:flutter/material.dart';
import 'package:untitled_app/components/form/link_text.dart';
import 'package:untitled_app/components/form/policies.dart';

/// Bottom content for the forms (sign up & log in pages)
///
/// This is used to create the bottom content for the sign in and log in pages, making it easier to maintain and read down a page
class FormBottomContent extends StatelessWidget {
  const FormBottomContent({
    super.key,
    required this.bottomText,
    required this.bottomLink,
    required this.navigationMethod,
  });

  final String bottomText;
  final String bottomLink;
  final Function()? navigationMethod;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 50.0,
          right: 50.0,
          top: 30.0,
          bottom: 30.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const PoliciesText(),
            LinkText(
              primaryText: bottomText,
              secondaryText: bottomLink,
              navigationMethod: navigationMethod,
            ),
          ],
        ),
      ),
    );
  }
}
