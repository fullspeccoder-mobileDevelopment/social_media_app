import 'package:flutter/material.dart';

/// Form title component used to create the form titles (sign up and log in pages)
///
/// Helps in creating a title with some sub text underneath to look presentable almost like an app bar component
class FormTitle extends StatelessWidget {
  const FormTitle({
    super.key,
    required this.primaryText,
    required this.subText,
  });

  final String primaryText;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430,
      height: 159,
      padding: const EdgeInsets.only(top: 55),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            primaryText,
            style: const TextStyle(
              fontSize: 22,
              letterSpacing: -1.0,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subText,
            style: const TextStyle(
              color: Color.fromRGBO(130, 130, 130, 1),
              fontSize: 14,
              letterSpacing: -0.25,
            ),
          ),
        ],
      ),
    );
  }
}
