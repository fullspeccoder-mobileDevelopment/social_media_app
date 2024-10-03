// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/form/sign_in_button.dart';
import 'package:untitled_app/components/misc/line_or.dart';
import 'package:untitled_app/providers/create_post_provider.dart';
import 'package:untitled_app/providers/post_provider.dart';
import 'package:untitled_app/providers/user_provider.dart';
import 'package:untitled_app/styles/button_styles.dart';
import 'package:untitled_app/utils/nav_utils.dart' as r;
import 'package:untitled_app/utils/snack_utils.dart';
import 'package:untitled_app/utils/validation_checking.dart';

/// The sign up form
///
/// Uses the eyeToggled variable to determine whether the eye icon is active or inactive
/// This will be the control center for signing up through Google, phone, email, contains links to the terms & conditions along with the privacy policy
class FirebaseForm extends ConsumerStatefulWidget {
  const FirebaseForm(
      {super.key,
      required this.formAction,
      required this.googleAction,
      required this.isSigningUp});

  final Future<void> Function(String email, String password) formAction;
  final Future<void> Function() googleAction;
  final bool isSigningUp;

  @override
  ConsumerState<FirebaseForm> createState() => _FirebaseFormState();
}

class _FirebaseFormState extends ConsumerState<FirebaseForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool eyeToggled = true;

  Widget determineEyeIcon() {
    if (eyeToggled) {
      return IconButton(
        onPressed: toggleEyeIcon,
        icon: const Icon(Icons.remove_red_eye_outlined),
      );
    } else {
      return IconButton(
        onPressed: toggleEyeIcon,
        icon: const Icon(Icons.remove_red_eye),
      );
    }
  }

  void toggleEyeIcon() {
    setState(() {
      eyeToggled = !eyeToggled;
    });
  }

  void _formSignUpAction() async {
    ref.read(actionButtonProvider.notifier).state = true;
    try {
      if (widget.isSigningUp) showSnackBarSignUpProcessingMessage(context);
      if (!widget.isSigningUp) showSnackBarLogInProcessingMessage(context);

      await widget.formAction(_emailController.text, _passwordController.text);

      if (!widget.isSigningUp) {
        final userId = ref.read(userProvider).id;
        await ref.read(postsProvider.notifier).retrievePosts(userId);
      }

      if (context.mounted) {
        ref.read(actionButtonProvider.notifier).state = false;
        Navigator.pop(context);
        Navigator.push(context, r.Route.successfulSignUp);
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBarErrorMessage(
            context, '$e\n\nHave you signed in using Google before?');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              hintText: 'Email',
              errorText: validate(
                textToValidate: _emailController.text,
                buttonPressed: ref.watch(actionButtonProvider),
                message: 'Email is empty or invalid',
              ),
            ),
          ),
          TextField(
            controller: _passwordController,
            obscureText: eyeToggled,
            decoration: InputDecoration(
              suffixIcon: determineEyeIcon(),
              hintText: "Password",
              errorText: validate(
                textToValidate: _passwordController.text,
                buttonPressed: ref.watch(actionButtonProvider),
                message: 'Password is empty or invalid',
              ),
            ),
          ),
          const LineOr(),
          SignInButton(
            image: "assets/images/google.png",
            text: "Continue with Google",
            triggerOnPressed: () {
              ref.read(actionButtonProvider.notifier).state = false;
              widget.googleAction();
              Navigator.popAndPushNamed(context, '/home');
            },
          ),
          SignInButton(
            image: "assets/images/phone.png",
            text: "Continue with Phone ",
            triggerOnPressed: () {
              ref.read(actionButtonProvider.notifier).state = false;
              if (widget.isSigningUp) {
                Navigator.pushNamed(context, '/phone-sign-up');
                return;
              }
              Navigator.pushNamed(context, '/phone-login');
            },
          ),
          const Divider(),
          TextButton(
            key: const ValueKey("form-key"),
            onPressed: _formSignUpAction,
            style: PrimaryButtonStyle(),
            child: const Text(
              "Continue",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
