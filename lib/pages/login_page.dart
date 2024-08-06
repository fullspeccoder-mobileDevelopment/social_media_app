import 'package:flutter/material.dart';
import 'package:untitled_app/styles/button_styles.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
              Text("Log in to"),
              SizedBox(height: 15),
              Text(
                "Enter into your account",
                style: TextStyle(
                  color: Color.fromRGBO(130, 130, 130, 1),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          height: 600,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const TextField(
                decoration: InputDecoration(
                  hintText: "Username",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 5, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              TextField(
                obscureText: eyeToggled,
                decoration: InputDecoration(
                  suffixIcon: determineEyeIcon(),
                  hintText: "Password",
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(width: 5, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: useGreyDivider(),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
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
                    ),
                  ],
                ),
              ),
              useGreyDivider(),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.blue.shade900,
                  minimumSize: const Size(600, 50),
                ),
                child: const Text("Continue",
                    style: TextStyle(color: Colors.white)),
              ),
            ],
          )),
    );
  }
}
