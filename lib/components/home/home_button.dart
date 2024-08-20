import 'package:flutter/material.dart';

/// This button will add a post
class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      tooltip: 'Add Item',
      child: const Icon(Icons.add_rounded, size: 50),
    );
  }
}
