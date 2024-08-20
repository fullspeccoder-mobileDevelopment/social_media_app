import 'package:flutter/material.dart';
import 'package:untitled_app/components/forms/bottom_content.dart';
import 'package:untitled_app/components/forms/log_in_form.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

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
      body: const Column(
        children: [
          LogInForm(),
          FormBottomContent(),
        ],
      ),
    );
  }
}
