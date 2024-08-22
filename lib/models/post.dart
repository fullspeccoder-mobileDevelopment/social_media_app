// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Post {
  final String postId;
  final String content;
  final String imageUrl;
  final String userId;
  final List<String> tags;
  final DateTime postDate;

  Post({
    required this.postId,
    required this.content,
    required this.imageUrl,
    required this.userId,
    required this.tags,
    required this.postDate,
  });

  Post copyWith({
    String? postId,
    String? content,
    String? imageUrl,
    String? userId,
    List<String>? tags,
    DateTime? postDate,
  }) {
    return Post(
      postId: postId ?? this.postId,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      userId: userId ?? this.userId,
      tags: tags ?? this.tags,
      postDate: postDate ?? this.postDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postId': postId,
      'content': content,
      'imageUrl': imageUrl,
      'userId': userId,
      'tags': tags,
      'postDate': postDate.millisecondsSinceEpoch,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      postId: map['postId'] as String,
      content: map['content'] as String,
      imageUrl: map['imageUrl'] as String,
      userId: map['userId'] as String,
      tags: List<String>.from(map['tags'] as List<String>),
      postDate: DateTime.fromMillisecondsSinceEpoch(map['postDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Post(postId: $postId, content: $content, imageUrl: $imageUrl, userId: $userId, tags: $tags, postDate: $postDate)';
  }

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.postId == postId &&
        other.content == content &&
        other.imageUrl == imageUrl &&
        other.userId == userId &&
        listEquals(other.tags, tags) &&
        other.postDate == postDate;
  }

  @override
  int get hashCode {
    return postId.hashCode ^
        content.hashCode ^
        imageUrl.hashCode ^
        userId.hashCode ^
        tags.hashCode ^
        postDate.hashCode;
  }
}
