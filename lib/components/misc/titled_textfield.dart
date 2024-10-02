import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/providers/create_post_provider.dart';
import 'package:untitled_app/utils/validation_checking.dart';

class TitledTextField extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
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
            errorText: validate(
              textToValidate: controller.text,
              buttonPressed: ref.watch(actionButtonProvider),
              message: '$labelText is empty or invalid',
            ),
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