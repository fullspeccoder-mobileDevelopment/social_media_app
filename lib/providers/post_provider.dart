import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/models/post.dart';

final postsProvider = StateNotifierProvider<PostsNotifier, List<Post>>((ref) {
  return PostsNotifier();
});

class PostsNotifier extends StateNotifier<List<Post>> {
  PostsNotifier() : super([]);

  Future<void> addPost(Post post) async {
    state = [...state, post];
  }

  Future<void> deletePost(String postId) async {
    state = state.where((post) => post.postId != postId).toList();
  }

  Future<void> updatePost(Post post, String postId) async {
    throw UnimplementedError();
  }

  Future<void> retrievePost(String postId) async {
    throw UnimplementedError();
  }

  Future<void> retrievePosts(String postId, String userId) async {
    // TODO: Some asynchronous wizardry to get the posts for the specified user
    throw UnimplementedError();
  }
}
