import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/form/bottom_content.dart';
import 'package:untitled_app/components/form/firebase_form.dart';
import 'package:untitled_app/components/form/form_title.dart';
import 'package:untitled_app/providers/create_post_provider.dart';
import 'package:untitled_app/providers/user_provider.dart';
import 'package:untitled_app/utils/nav_utils.dart';

class LogInPage extends ConsumerWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.read(userProvider.notifier);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          children: [
            const FormTitle(
              primaryText: "Log in to",
              subText: "Enter into your account",
            ),
            FirebaseForm(
              formAction: userNotifier.logIn,
              googleAction: userNotifier.logInWithGoogle,
              isSigningUp: false,
            ),
            FormBottomContent(
              bottomText: "Didn't have an account? ",
              bottomLink: "Sign up",
              navigationMethod: () {
                ref.read(actionButtonProvider.notifier).state = false;
                Navigator.popAndPushNamed(context, Routes.signUpString);
              },
            ),
          ],
        ),
      ),
    );
  }
}
