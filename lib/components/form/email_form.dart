import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/misc/primary_button.dart';
import 'package:untitled_app/components/misc/spaced_divider.dart';
import 'package:untitled_app/providers/user_provider.dart';
import 'package:untitled_app/utils/nav_utils.dart' as r;

class EmailForm extends ConsumerWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  EmailForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userNotifier = ref.read(userProvider.notifier);
    return Column(
      children: [
        TextField(
          controller: emailController,
          decoration: const InputDecoration(
              labelText: "Email", hintText: "Enter your email"),
        ),
        const SizedBox(height: 25),
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(
              labelText: "Password", hintText: "Enter your password"),
        ),
        const SpacedDivider(
          whitespace: 25,
          color: Colors.grey,
        ),
        PrimaryButton(
          callback: () {
            userNotifier.signUpWithEmail(
                emailController.text, passwordController.text);
            Navigator.pop(context);
            Navigator.push(context, r.Route.successfulSignUp);
          },
          text: 'Next',
        ),
      ],
    );
  }
}
