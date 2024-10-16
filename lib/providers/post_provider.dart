import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:untitled_app/models/firebase_post.dart';
import 'package:untitled_app/utils/path_manipulation.dart';

final postsProvider =
    StateNotifierProvider<PostsNotifier, List<LocalPost>>((ref) {
  return PostsNotifier();
});

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

  @override
  String toString() {
    return 'LocalPost(postId: $postId, content: $content, imageUrl: $imageUrl, userId: $userId, tags: $tags, postDate: $postDate)';
  }
}

class PostsNotifier extends StateNotifier<List<LocalPost>> {
  PostsNotifier() : super([]);

  final FirebaseFirestore _store = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  /// Creates a post on Firebase
  ///
  /// Use [post] to add to [Firebase]
  Future<void> createPost(FirebasePost post, File image) async {
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
    state = [
      ...state,
      LocalPost.fromMap(
          postId: docSnapshot.id, docSnapshot.data() as Map<String, dynamic>)
    ];
  }

  Future<void> deletePost(String postId) async {
    throw UnimplementedError();
  }

  Future<void> updatePost(FirebasePost post, String postId) async {
    throw UnimplementedError();
  }

  /// Retrieves a post from state
  ///
  /// [postId] is a specific post id to get from the state
  FirebasePost retrievePost(String postId) {
    /// Creates a filtered list of the post id that is available
    final filteredList =
        state.where((element) => element.postId == postId).toList();
    // Returns a Post object for the data from the post
    return FirebasePost.fromMap(filteredList.first.toMap());
  }

  /// Retrieves posts using a list
  ///
  /// [postIds] is taken from the list of post ids in the user document
  Future<void> retrievePosts(String userId) async {
    // Querys Firestore
    final QuerySnapshot postQuery = await _store
        .collection('posts')
        .where('userId', isEqualTo: userId)
        .get();

    // Creates a lists of posts from the data recieved from query snapshot
    final posts = postQuery.docs
        .map((el) =>
            LocalPost.fromMap(el.data() as Map<String, dynamic>, postId: el.id))
        .toList();

    // Updates state to firestore posts
    state = posts;
  }

  /// Uploads an image to the Firestorage.
  ///
  /// [SettableMetadata] is used to specify specific parameters for things such as post id, user id, etc...
  /// [File] is used for the actual image to be stored in the [FireStorage]
  Future<void> _uploadImageToFireStorage(
      SettableMetadata metaData, File image) async {
    // Creates a reference to the FireStorage
    final Reference storageRef = _storage.ref();

    // Gets the image name of the file
    final imageName = getFileNameFromAbsolutePath(image.path);

    // Starts upload to FireStorage
    final uploadTask =
        storageRef.child("postImages/$imageName").putFile(image, metaData);

    // Listens to snapshots in the background to track how the upload is doing
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
