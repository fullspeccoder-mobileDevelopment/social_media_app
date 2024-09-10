class FirebaseUser {
  final String email;
  final String username;
  final String profilePicUrl;
  final List<String> posts;
  final Map<String, dynamic> accessTokens;

  const FirebaseUser({
    required this.email,
    required this.username,
    required this.profilePicUrl,
    required this.posts,
    required this.accessTokens,
  });

  FirebaseUser copyWith({
    String? email,
    String? username,
    String? profilePicUrl,
    List<String>? posts,
    Map<String, dynamic>? accessTokens,
  }) {
    return FirebaseUser(
      email: email ?? this.email,
      username: username ?? this.username,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      posts: posts ?? this.posts,
      accessTokens: accessTokens ?? this.accessTokens,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'profilePicUrl': profilePicUrl,
      'posts': posts,
      'accessTokens': accessTokens,
    };
  }

  factory FirebaseUser.fromMap(Map<String, dynamic> map) {
    return FirebaseUser(
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      profilePicUrl: map['profilePicUrl'] ?? '',
      posts: List<String>.from(map['posts']),
      accessTokens: Map<String, dynamic>.from(map['accessTokens']),
    );
  }
}
