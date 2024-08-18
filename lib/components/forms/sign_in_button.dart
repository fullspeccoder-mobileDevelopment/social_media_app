import 'package:flutter/material.dart';
import 'package:untitled_app/styles/button_styles.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required this.image,
    required this.text,
    required this.triggerOnPressed,
  });

  final String image;
  final String text;
  final void Function() triggerOnPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: triggerOnPressed,
      style: useGreyRoundedBorder(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(image),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            textDirection: TextDirection.ltr,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
