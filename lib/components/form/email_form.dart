import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/misc/primary_button.dart';
import 'package:untitled_app/components/misc/spaced_divider.dart';
import 'package:untitled_app/providers/create_post_provider.dart';
import 'package:untitled_app/providers/user_provider.dart';
import 'package:untitled_app/utils/nav_utils.dart' as r;
import 'package:untitled_app/utils/snack_utils.dart';
import 'package:untitled_app/utils/validation_checking.dart';

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
          decoration: InputDecoration(
            labelText: "Email",
            hintText: "Enter your email",
            errorText: validate(
              textToValidate: emailController.text,
              buttonPressed: ref.watch(actionButtonProvider),
              message: 'Email is empty or invalid',
            ),
          ),
        ),
        const SizedBox(height: 25),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            errorText: validate(
              textToValidate: passwordController.text,
              buttonPressed: ref.watch(actionButtonProvider),
              message: 'Password is empty or invalid',
            ),
          ),
        ),
        const SpacedDivider(
          whitespace: 25,
          color: Colors.grey,
        ),
        PrimaryButton(
          callback: () async {
            ref.read(actionButtonProvider.notifier).state = true;
            try {
              await userNotifier.signUpWithEmail(
                  emailController.text, passwordController.text);
            } catch (e) {
              showSnackBarErrorMessage(context, e);
              return;
            }
            ref.read(actionButtonProvider.notifier).state = false;
            Navigator.pop(context);
            Navigator.push(context, r.Route.successfulSignUp);
          },
          text: 'Next',
        ),
      ],
    );
  }
}
