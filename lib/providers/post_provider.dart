import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:untitled_app/models/post.dart';
import 'package:untitled_app/utils/path_manipulation.dart';

final postsProvider = StateNotifierProvider<PostsNotifier, PostList>((ref) {
  return PostsNotifier();
});

class PostList {
  final String id;
  final List<LocalPost> posts;

  PostList({
    required this.id,
    required this.posts,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'posts': posts.map((x) => x.toMap()).toList(),
    };
  }
}

class LocalPost {
  final String postId;
  final String content;
  final String imageUrl;
  final String userId;
  final List<String> tags;
  final Timestamp postDate;

  LocalPost({
    required this.postId,
    required this.content,
    required this.imageUrl,
    required this.userId,
    required this.tags,
    required this.postDate,
  });

  LocalPost copyWith({
    String? postId,
    String? content,
    String? imageUrl,
    String? userId,
    List<String>? tags,
    Timestamp? postDate,
  }) {
    return LocalPost(
      postId: postId ?? this.postId,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      userId: userId ?? this.userId,
      tags: tags ?? this.tags,
      postDate: postDate ?? this.postDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'content': content,
      'imageUrl': imageUrl,
      'userId': userId,
      'tags': tags,
      'postDate': postDate,
    };
  }

  factory LocalPost.fromMap(Map<String, dynamic> map,
      {required String postId}) {
    return LocalPost(
      postId: postId,
      content: map['content'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      userId: map['userId'] ?? '',
      tags: List<String>.from(map['tags']),
      postDate: map['postDate'],
    );
  }
}

class PostsNotifier extends StateNotifier<PostList> {
  PostsNotifier() : super(PostList(id: "N/A", posts: []));

  final FirebaseFirestore _store = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> createPost(Post post, File image) async {
    // Firebase Addition
    final DocumentReference docReference =
        await _store.collection('posts').add(post.toMap());

    final DocumentSnapshot docSnapshot = await docReference.get();

    // Image Uploading
    _uploadImageToFireStorage(
        SettableMetadata(
            customMetadata: {'userId': post.userId, 'postId': docSnapshot.id}),
        image);

    // State setting
    state = PostList(id: docSnapshot.id, posts: [
      ...state.posts,
      LocalPost.fromMap(
          postId: docSnapshot.id, docSnapshot.data() as Map<String, dynamic>),
    ]);
  }

  Future<void> deletePost(String postId) async {
    // state = state.where((post) => post.postId != postId).toList();
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

  Future<void> _uploadImageToFireStorage(
      SettableMetadata metaData, File image) async {
    final Reference storageRef = _storage.ref();

    final imageName = getFileNameFromAbsolutePath(image.path);

    final uploadTask =
        storageRef.child("postImages/$imageName").putFile(image, metaData);

    uploadTask.snapshotEvents.listen((TaskSnapshot taskSnapshot) {
      switch (taskSnapshot.state) {
        case TaskState.running:
          final progress =
              100.0 * (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
          print("Upload is $progress% complete.");
          break;
        case TaskState.paused:
          print("Upload is paused.");
          break;
        case TaskState.canceled:
          print("Upload was canceled");
          break;
        case TaskState.error:
          // Handle unsuccessful uploads
          break;
        case TaskState.success:
          // Handle successful uploads on complete
          // ...
          break;
      }
    });
  }
}
