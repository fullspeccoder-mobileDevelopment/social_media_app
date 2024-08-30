import 'package:flutter/material.dart';

class TextInputContainerExtended extends StatelessWidget {
  const TextInputContainerExtended(
      {super.key, required this.text, required this.child});

  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          child,
        ],
      ),
    );
  }
}
