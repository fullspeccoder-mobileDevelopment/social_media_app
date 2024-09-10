import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/components/home/post_card.dart';
import 'package:untitled_app/providers/post_provider.dart';

/// Holds the main content of the home page
///
/// Contains an image for the mobile bro image, text, and a text reading snapshot.
/// Will eventually contain a list of the posts made by the user
class HomeContent extends ConsumerWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsProvider).posts;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (posts.isEmpty) ...[
              // Container(
              //   width: 375,
              //   height: 400,
              //   margin: const EdgeInsets.only(top: 100),
              //   alignment: Alignment.center,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Image.asset(
              //         "assets/images/mobile_bro.png",
              //         width: 300,
              //         height: 250,
              //         fit: BoxFit.contain,
              //       ),
              //       const Text(
              //         "Lorem ipsum dolor sit amet consectetur. Ornare sit enim vitae ullamcorper.",
              //         textAlign: TextAlign.center,
              //         style: TextStyle(
              //           fontSize: 18,
              //           color: Color.fromRGBO(106, 106, 106, 1),
              //         ),
              //       ),
              //       TextButton(
              //         onPressed: () {
              //           Navigator.of(context).popAndPushNamed('/create-post');
              //         },
              //         style: PrimaryButtonStyle(),
              //         child: const Text(
              //           "Upload your first shot",
              //           style: TextStyle(
              //             color: Colors.white,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ] else ...[
              PostCard(
                post: posts[0],
              )
            ]
          ],
        ),
      ],
    );
  }
}
