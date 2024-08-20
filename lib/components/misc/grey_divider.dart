import 'package:flutter/material.dart';

/// Creates a grey divider across the screen
class GreyDivider extends StatelessWidget {
  const GreyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.grey,
      thickness: 1,
    );
  }
}
