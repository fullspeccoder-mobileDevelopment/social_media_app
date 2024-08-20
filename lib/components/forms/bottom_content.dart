import 'package:flutter/material.dart';
import 'package:untitled_app/components/forms/link_text.dart';
import 'package:untitled_app/components/forms/policies.dart';

class FormBottomContent extends StatelessWidget {
  const FormBottomContent({super.key});

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
              primaryText: "Already have an account? ",
              secondaryText: "Log in",
              navigationMethod: () {
                Navigator.of(context).popAndPushNamed('/log-in');
              },
            ),
          ],
        ),
      ),
    );
  }
}
