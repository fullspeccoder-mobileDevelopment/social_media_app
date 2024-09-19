// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/form/sign_in_button.dart';
import 'package:untitled_app/components/misc/line_or.dart';
import 'package:untitled_app/styles/button_styles.dart';
import 'package:untitled_app/styles/input_styles.dart';
import 'package:untitled_app/utils/nav_utils.dart' as r;
import 'package:untitled_app/utils/snack_utils.dart';

/// The sign up form
///
/// Uses the eyeToggled variable to determine whether the eye icon is active or inactive
/// This will be the control center for signing up through Google, phone, email, contains links to the terms & conditions along with the privacy policy
class FirebaseForm extends ConsumerStatefulWidget {
  const FirebaseForm(
      {super.key, required this.formAction, required this.googleAction});

  final Future<void> Function(String email, String password) formAction;
  final Future<void> Function() googleAction;

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
    try {
      await widget.formAction(_emailController.text, _passwordController.text);
      // await ref.read(userProvider.notifier).signUp(
      //       _emailController.text,
      //       _passwordController.text,
      //     );
      if (context.mounted) {
        Navigator.pop(context);
        Navigator.push(context, r.Route.successfulSignUp);
      }
    } catch (e) {
      if (context.mounted) showSnackBarErrorMessage(context, e);
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
            decoration: const UsernameDecoration(),
          ),
          TextField(
            controller: _passwordController,
            obscureText: eyeToggled,
            decoration: PasswordDecoration(suffixIcon: determineEyeIcon()),
          ),
          const LineOr(),
          SignInButton(
            image: "assets/images/google.png",
            text: "Continue with Google",
            triggerOnPressed: () {
              widget.googleAction();
              Navigator.popAndPushNamed(context, '/home');
            },
          ),
          SignInButton(
            image: "assets/images/phone.png",
            text: "Continue with Phone ",
            triggerOnPressed: () {
              Navigator.pushNamed(context, '/phone-sign-up');
            },
          ),
          const Divider(),
          TextButton(
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
