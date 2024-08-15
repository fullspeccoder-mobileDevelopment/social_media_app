import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/line_or.dart';
import 'package:untitled_app/components/logistics_hyperlink.dart';
import 'package:untitled_app/components/sign_in_button.dart';
import 'package:untitled_app/providers/user_provider.dart';
import 'package:untitled_app/styles/button_styles.dart';
import 'package:untitled_app/styles/input_styles.dart';
import 'package:untitled_app/utils/nav_utils.dart';
import 'package:untitled_app/utils/snack_utils.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool eyeToggled = true;

  Widget? determineEyeIcon() {
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

  Widget createContent() {
    return Container(
      height: 600,
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: _emailController,
            decoration: generateUsernameDecoration(),
          ),
          TextField(
            controller: _passwordController,
            obscureText: eyeToggled,
            decoration: generatePasswordDecoration(determineEyeIcon()),
          ),
          const LineOr(),
          SignInButton(
            image: "assets/images/google.png",
            text: "Continue with Google",
            triggerOnPressed: () {},
          ),
          SignInButton(
            image: "assets/images/phone.png",
            text: "Continue with Phone",
            triggerOnPressed: () {},
          ),
          useGreyDivider(),
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

  Widget createBottomContent() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 50.0,
          right: 50.0,
          top: 30.0,
          bottom: 30.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            generatePoliciesHyperText(context),
            generateLinkText(
              context,
              primaryText: "Already have an account? ",
              secondaryText: "Log in",
              navigationMethod: () {
                Navigator.of(context).popAndPushNamed('/log-in');
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Container(
          margin: const EdgeInsets.only(top: 10),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign up for"),
              SizedBox(height: 15),
              Text(
                "Create your account",
                style: TextStyle(
                  color: Color.fromRGBO(130, 130, 130, 1),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          createContent(),
          createBottomContent(),
        ],
      ),
    );
  }
}
