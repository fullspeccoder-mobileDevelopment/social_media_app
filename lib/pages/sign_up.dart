import 'package:flutter/material.dart';
import 'package:untitled_app/components/forms/bottom_content.dart';
import 'package:untitled_app/components/forms/sign_up_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //& TODO: Fix Title widgets here. Needs to NOT be an AppBar
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
      body: const Column(
        children: [
          SignUpForm(),
          FormBottomContent(),
        ],
      ),
    );
  }
}
