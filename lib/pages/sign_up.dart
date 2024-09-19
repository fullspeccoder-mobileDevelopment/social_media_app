import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/form/bottom_content.dart';
import 'package:untitled_app/components/form/form_title.dart';
import 'package:untitled_app/components/form/firebase_form.dart';
import 'package:untitled_app/providers/user_provider.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.read(userProvider.notifier);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Column(
          children: [
            const FormTitle(
              primaryText: "Sign up for",
              subText: "Create your account",
            ),
            FirebaseForm(
              formAction: userNotifier.signUpWithEmail,
              googleAction: userNotifier.signUpWithGoogle,
              isSigningUp: true,
            ),
            FormBottomContent(
              bottomText: "Already have an account? ",
              bottomLink: "Log in",
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
