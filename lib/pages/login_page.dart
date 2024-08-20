import 'package:flutter/material.dart';
import 'package:untitled_app/components/forms/bottom_content.dart';
import 'package:untitled_app/components/forms/form_title.dart';
import 'package:untitled_app/components/forms/log_in_form.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const FormTitle(
            primaryText: "Log in to",
            subText: "Enter into your account",
          ),
          const LogInForm(),
          FormBottomContent(
            bottomText: "Didn't have an account? ",
            bottomLink: "Sign up",
            navigationMethod: () {
              Navigator.of(context).popAndPushNamed("/sign-up");
            },
          ),
        ],
      ),
    );
  }
}
