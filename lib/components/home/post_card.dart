import 'package:flutter/material.dart';
import 'package:untitled_app/providers/post_provider.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});

  final LocalPost post;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 375,
      height: 200,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (post.imageUrl.isNotEmpty) ...[
              const Image(
                  width: 200,
                  height: 100,
                  image: NetworkImage(
                      'https://plus.unsplash.com/premium_photo-1724076827133-593437b8f16a?q=80&w=1287&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("16/08/2024"), Text("3:30pm")],
              )
            ] else ...[
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text("16/08/2024"), Text("3:30pm")],
              )
            ]
          ],
        ),
      ),
    );
  }
}
