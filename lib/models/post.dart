// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Post {
  final String id;
  final String content;
  final String imageUrl;
  final String author;
  final List<String> tags;
  // final Timestamp postDate;
  Post({
    required this.id,
    required this.content,
    required this.imageUrl,
    required this.author,
    required this.tags,
  });

  Post copyWith({
    String? id,
    String? content,
    String? imageUrl,
    String? author,
    List<String>? tags,
  }) {
    return Post(
      id: id ?? this.id,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      author: author ?? this.author,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
      'imageUrl': imageUrl,
      'author': author,
      'tags': tags,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as String,
      content: map['content'] as String,
      imageUrl: map['imageUrl'] as String,
      author: map['author'] as String,
      tags: List<String>.from(map['tags'] as List<String>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Post(id: $id, content: $content, imageUrl: $imageUrl, author: $author, tags: $tags)';
  }

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.content == content &&
        other.imageUrl == imageUrl &&
        other.author == author &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        content.hashCode ^
        imageUrl.hashCode ^
        author.hashCode ^
        tags.hashCode;
  }
}
