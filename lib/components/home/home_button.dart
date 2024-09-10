import 'package:flutter/material.dart';
import 'package:untitled_app/pages/create_post.dart';

/// This button will add a post
class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const CreatePostPage()));
      },
      tooltip: 'Add Item',
      child: const Icon(Icons.add_rounded, size: 50),
    );
  }
}
