import 'package:flutter/material.dart';

class TextInputContainer extends StatelessWidget {
  const TextInputContainer(
      {super.key, required this.text, required this.controller});

  final String text;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          TextField(controller: controller),
        ],
      ),
    );
  }
}
