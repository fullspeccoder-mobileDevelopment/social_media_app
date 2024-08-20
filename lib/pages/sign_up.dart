import 'package:flutter/material.dart';
import 'package:untitled_app/components/forms/bottom_content.dart';
import 'package:untitled_app/components/forms/form_title.dart';
import 'package:untitled_app/components/forms/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const FormTitle(
            primaryText: "Sign up for",
            subText: "Create your account",
          ),
          const SignUpForm(),
          FormBottomContent(
            bottomText: "Already have an account? ",
            bottomLink: "Log in",
            navigationMethod: () {
              Navigator.of(context).popAndPushNamed('/log-in');
            },
          ),
        ],
      ),
    );
  }
}
