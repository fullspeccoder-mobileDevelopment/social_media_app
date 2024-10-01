import 'package:flutter/material.dart';
import 'package:untitled_app/styles/button_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.callback, required this.text});

  final void Function()? callback;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: PrimaryButtonStyle(),
      onPressed: callback,
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
