import 'package:flutter/material.dart';

class TitledTextField extends StatelessWidget {
  const TitledTextField(
      {super.key,
      required this.text,
      required this.controller,
      this.isPassword = false,
      this.labelText});

  final String text;
  final TextEditingController controller;
  final bool isPassword;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text,
            ),
          ],
        ),
        TextField(
          obscureText: isPassword,
          controller: controller,
          decoration: InputDecoration(
            labelText: isPassword == true ? '1234media' : labelText,
            floatingLabelBehavior: labelText != null || isPassword == true
                ? FloatingLabelBehavior.never
                : FloatingLabelBehavior.auto,
          ),
        )
      ],
    );
  }
}

// decoration: const InputDecoration(
//                     labelText: '1234media',
//                     floatingLabelBehavior: FloatingLabelBehavior.never,
//                   ),