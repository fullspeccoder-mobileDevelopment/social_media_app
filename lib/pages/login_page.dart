import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/form/bottom_content.dart';
import 'package:untitled_app/components/form/firebase_form.dart';
import 'package:untitled_app/components/form/form_title.dart';
import 'package:untitled_app/components/form/log_in_form.dart';
import 'package:untitled_app/providers/user_provider.dart';

class LogInPage extends ConsumerWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logIn = ref.read(userProvider.notifier).logIn;
    return Scaffold(
      body: Column(
        children: [
          const FormTitle(
            primaryText: "Log in to",
            subText: "Enter into your account",
          ),
          FirebaseForm(
            formAction: logIn,
          ),
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
