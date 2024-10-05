import 'package:flutter/material.dart';
import 'package:untitled_app/utils/nav_utils.dart';

/// This button will add a post
class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, Routes.createPostString);
      },
      tooltip: 'Add Item',
      child: const Icon(Icons.add_rounded, size: 50),
    );
  }
}
