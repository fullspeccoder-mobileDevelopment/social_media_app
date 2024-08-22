// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String content;
  final String imageUrl;
  final String userId;
  final List<String> tags;
  final Timestamp postDate;

  Post({
    required this.content,
    required this.imageUrl,
    required this.userId,
    required this.tags,
    required this.postDate,
  });

  Post copyWith({
    String? content,
    String? imageUrl,
    String? userId,
    List<String>? tags,
    Timestamp? postDate,
  }) {
    return Post(
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      userId: userId ?? this.userId,
      tags: tags ?? this.tags,
      postDate: postDate ?? this.postDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'content': content,
      'imageUrl': imageUrl,
      'userId': userId,
      'tags': tags,
      'postDate': postDate,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      content: map['content'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      userId: map['userId'] ?? '',
      tags: List<String>.from(map['tags']),
      postDate: map['postDate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(content: $content, imageUrl: $imageUrl, userId: $userId, tags: $tags, postDate: $postDate)';
  }
}
