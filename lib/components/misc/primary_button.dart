import 'package:flutter/material.dart';
import 'package:untitled_app/styles/button_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key, required this.callback});

  final void Function()? callback;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: PrimaryButtonStyle(),
      onPressed: callback,
      child: const Text("Continue", style: TextStyle(color: Colors.white)),
    );
  }
}
