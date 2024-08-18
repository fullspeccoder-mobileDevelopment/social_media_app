import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      backgroundColor: Colors.blue.shade400,
      foregroundColor: Colors.white,
      onPressed: () {},
      tooltip: 'Add Item',
      shape: const CircleBorder(),
      child: const Icon(Icons.add_rounded, size: 50),
    );
  }
}
