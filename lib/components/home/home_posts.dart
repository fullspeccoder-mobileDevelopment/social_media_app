import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/home/post_card.dart';
import 'package:untitled_app/components/misc/primary_button.dart';
import 'package:untitled_app/providers/post_provider.dart';

class HomePosts extends ConsumerWidget {
  const HomePosts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsProvider);
    print(posts);
    if (posts.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (_, index) => PostCard(post: posts[index]),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 375,
              height: 400,
              margin: const EdgeInsets.only(top: 100),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/mobile_bro.png",
                    width: 300,
                    height: 250,
                    fit: BoxFit.contain,
                  ),
                  const Text(
                    "Lorem ipsum dolor sit amet consectetur. Ornare sit enim vitae ullamcorper.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(106, 106, 106, 1),
                    ),
                  ),
                  PrimaryButton(
                    callback: () {
                      Navigator.of(context).pushNamed('/create-post');
                    },
                    text: 'Upload your first shot',
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
