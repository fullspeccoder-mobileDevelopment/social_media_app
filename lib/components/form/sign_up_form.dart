import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/form/sign_in_button.dart';
import 'package:untitled_app/components/misc/line_or.dart';
import 'package:untitled_app/providers/user_provider.dart';
import 'package:untitled_app/styles/button_styles.dart';
import 'package:untitled_app/styles/input_styles.dart';
import 'package:untitled_app/utils/nav_utils.dart';
import 'package:untitled_app/utils/snack_utils.dart';

/// The sign up form
///
/// Uses the eyeToggled variable to determine whether the eye icon is active or inactive
/// This will be the control center for signing up through Google, phone, email, contains links to the terms & conditions along with the privacy policy
class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({super.key});

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
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
            triggerOnPressed: () {},
          ),
          SignInButton(
            image: "assets/images/phone.png",
            text: "Continue with Phone ",
            triggerOnPressed: () {},
          ),
          const Divider(),
          TextButton(
            onPressed: () async {
              try {
                await ref.read(userProvider.notifier).signUp(
                      _emailController.text,
                      _passwordController.text,
                    );
                popAndPushSignUpMessageConfirmation(context);
              } catch (e) {
                showSnackBarErrorMessage(context, e);
              }
            },
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
