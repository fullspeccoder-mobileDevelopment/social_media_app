import 'package:flutter/material.dart';
import 'package:untitled_app/styles/button_styles.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({
    super.key,
    required this.detailMessage,
    required this.titleMessage,
  });
  final String titleMessage;
  final String detailMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 45),
              child: const Image(
                image: AssetImage("assets/images/confirm.png"),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                titleMessage,
                style: const TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Text(
                detailMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.6)),
              ),
            ),
            TextButton(
              style: PrimaryButtonStyle(),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/home');
              },
              child: const Text(
                "Continue",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
