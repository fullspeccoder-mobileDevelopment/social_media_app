// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:untitled_app/models/post.dart';

class FirebaseUser {
  final String email;
  final String username;
  final String profilePicUrl;
  final List<String> posts;

  const FirebaseUser({
    required this.email,
    required this.username,
    required this.profilePicUrl,
    required this.posts,
  });

  FirebaseUser copyWith({
    String? email,
    String? username,
    String? profilePicUrl,
    List<String>? posts,
  }) {
    return FirebaseUser(
      email: email ?? this.email,
      username: username ?? this.username,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      posts: posts ?? this.posts,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'profilePicUrl': profilePicUrl,
      'posts': posts.map((x) => x).toList(),
    };
  }

  factory FirebaseUser.fromMap(Map<String, dynamic> map) {
    return FirebaseUser(
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      profilePicUrl: map['profilePicUrl'] ?? '',
      posts: List<String>.from(map['posts']?.map((x) => Post.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FirebaseUser.fromJson(String source) =>
      FirebaseUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FirebaseUser(email: $email, username: $username, profilePicUrl: $profilePicUrl, posts: $posts)';
  }
}
