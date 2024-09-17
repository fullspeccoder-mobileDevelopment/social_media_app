import 'dart:convert';

class FirebaseUser {
  final String email;
  final String username;
  final String profilePicUrl;
  final String phoneNumber;
  final List<String> posts;
  final Map<String, dynamic> accessTokens;

  const FirebaseUser({
    required this.email,
    required this.username,
    required this.profilePicUrl,
    required this.phoneNumber,
    required this.posts,
    required this.accessTokens,
  });

  FirebaseUser copyWith({
    String? email,
    String? username,
    String? profilePicUrl,
    String? phoneNumber,
    List<String>? posts,
    Map<String, dynamic>? accessTokens,
  }) {
    return FirebaseUser(
      email: email ?? this.email,
      username: username ?? this.username,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      posts: posts ?? this.posts,
      accessTokens: accessTokens ?? this.accessTokens,
    );
  }

  factory FirebaseUser.zero({
    String? email,
    String? username,
    String? profilePicUrl,
    String? phoneNumber,
    List<String>? posts,
  }) {
    return FirebaseUser(
      email: email ?? 'defaultEmail',
      username: username ?? 'defaultUsername',
      profilePicUrl: profilePicUrl ?? 'defaultProfilePic',
      phoneNumber: phoneNumber ?? 'defaultPhoneNumber',
      posts: posts ?? [],
      accessTokens: {},
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'profilePicUrl': profilePicUrl,
      'phoneNumber': phoneNumber,
      'posts': posts,
      'accessTokens': accessTokens,
    };
  }

  factory FirebaseUser.fromMap(Map<String, dynamic> map) {
    return FirebaseUser(
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      profilePicUrl: map['profilePicUrl'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      posts: List<String>.from(map['posts']),
      accessTokens: Map<String, dynamic>.from(map['accessTokens']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FirebaseUser.fromJson(String source) =>
      FirebaseUser.fromMap(json.decode(source));
}
