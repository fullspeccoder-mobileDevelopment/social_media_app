import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/models/firebase_post.dart';
import 'package:untitled_app/providers/date_provider.dart';
import 'package:untitled_app/providers/draft_provider.dart';
import 'package:untitled_app/providers/image_provider.dart';
import 'package:untitled_app/providers/post_provider.dart';
import 'package:untitled_app/providers/twitter_provider.dart';
import 'package:untitled_app/providers/user_provider.dart';
import 'package:untitled_app/utils/path_manipulation.dart';

class PostMaker {
  final WidgetRef ref;
  late String platform;
  late FirebasePost post;

  PostMaker({
    required this.ref,
  });

  Future<void> makePost(
      Map<String, dynamic> mappedPost, String platform) async {
    final postsNotifier = ref.read(postsProvider.notifier);
    final image = ref.watch(imageProvider);
    final imageNotifier = ref.read(imageProvider.notifier);

    post = FirebasePost.fromMap(mappedPost);

    await postsNotifier.createPost(post, image!);

    // _decidesWhereToPost();
    imageNotifier.resetImage();
  }

  void makeDraft(String description, List<String>? tags) {
    final user = ref.read(userProvider);
    final date = ref.read(dateProvider);
    final String? imagePath = ref.read(imageProvider)?.path;
    final Map<String, dynamic> mappedDraft = {
      'content': description,
      'imageUrl': getFileNameFromAbsolutePath(imagePath ?? ''),
      'userId': user.id,
      'tags': tags ?? [],
      'postDate': Timestamp.fromDate(date),
    };
    ref
        .read(draftProvider.notifier)
        .createDraft(FirebasePost.fromMap(mappedDraft));
  }

  // ignore: unused_element
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
