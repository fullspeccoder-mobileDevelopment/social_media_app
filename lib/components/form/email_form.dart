import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/providers/user_provider.dart';
import 'package:untitled_app/styles/button_styles.dart';
import 'package:untitled_app/utils/nav_utils.dart';

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
        const SizedBox(height: 25),
        const Divider(color: Colors.grey),
        const SizedBox(height: 25),
        TextButton(
          style: PrimaryButtonStyle(),
          onPressed: () {
            userNotifier.signUpWithEmail(
                emailController.text, passwordController.text);
            popAndPushSignUpMessageConfirmation(context);
          },
          child: const Text(
            "Next",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
