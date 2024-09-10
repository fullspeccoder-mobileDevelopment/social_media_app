import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/models/post.dart';
import 'package:untitled_app/providers/image_provider.dart';
import 'package:untitled_app/providers/post_provider.dart';
import 'package:untitled_app/providers/twitter_provider.dart';

class PostMaker {
  final WidgetRef ref;
  late String platform;
  late Post post;

  PostMaker({
    required this.ref,
  });

  void makePost(Map<String, dynamic> mappedPost, String platform) {
    final postsNotifier = ref.read(postsProvider.notifier);
    final image = ref.watch(imageProvider);
    final imageNotifier = ref.read(imageProvider.notifier);

    post = Post.fromMap(mappedPost);

    postsNotifier.createPost(post);

    _decidesWhereToPost();

    if (image != null) {
      imageNotifier.resetImage();
    }
  }

  void _decidesWhereToPost() {
    final twitterNotifier = ref.read(twitterProvider.notifier);

    switch (platform) {
      case 'Twitter(X)':
        twitterNotifier.createPostOnTwitter(post);
        break;
      default:
        print("No social media selected");
        break;
    }
  }
}
