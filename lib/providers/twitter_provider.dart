import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_api_v2/twitter_api_v2.dart';
import 'package:untitled_app/models/firebase_user.dart';
import 'package:untitled_app/models/post.dart';
import 'package:untitled_app/providers/user_provider.dart';

final twitterProvider =
    StateNotifierProvider<TwitterNotifier, FirebaseUser>((ref) {
  final firebaseUser = ref.watch(userProvider).user;
  return TwitterNotifier(firebaseUser: firebaseUser);
});

class TwitterNotifier extends StateNotifier<FirebaseUser> {
  TwitterNotifier({required firebaseUser}) : super(firebaseUser);

  Future<void> createPostOnTwitter(Post post) async {
    print(post);
    print(state.accessTokens);
    final twitterClient = TwitterApi(
      bearerToken: state.accessTokens['twitter'],
    );

    try {
      await twitterClient.tweets.createTweet(text: post.content);
    } catch (e) {
      print(e);
    }
  }
}
