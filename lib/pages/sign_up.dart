import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/logistics_hyperlink.dart';
import 'package:untitled_app/pages/confirmation_page.dart';
import 'package:untitled_app/providers/user_provider.dart';
import 'package:untitled_app/styles/button_styles.dart';
import 'package:untitled_app/styles/input_styles.dart';

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
          Row(
            children: [
              Expanded(
                child: useGreyDivider(),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'or',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Expanded(
                child: useGreyDivider(),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            style: useGreyRoundedBorder(),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/images/google.png"),
                ),
                SizedBox(width: 8),
                Text(
                  "Continue with Google",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            style: useGreyRoundedBorder(),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/images/phone.png"),
                ),
                SizedBox(width: 8),
                Text(
                  "Continue with Phone Number",
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          useGreyDivider(),
          TextButton(
            onPressed: () async {
              try {
                await ref.read(userProvider.notifier).signUp(
                      _emailController.text,
                      _passwordController.text,
                    );
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ConfirmationPage(
                              titleMessage: "Congratulations!",
                              detailMessage:
                                  "You have officially signed up for CrossMedia!",
                            )));
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(e.toString()),
                ));
              }
            },
            style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.blue.shade900,
              minimumSize: const Size(600, 50),
            ),
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
