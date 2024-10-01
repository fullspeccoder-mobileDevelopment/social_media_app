import 'dart:convert';

import 'package:flutter/foundation.dart';

class FirebaseUser {
  final String email;
  final String username;
  final String profilePicUrl;
  final String phoneNumber;
  final Map<String, dynamic> accessTokens;

  const FirebaseUser({
    required this.email,
    required this.username,
    required this.profilePicUrl,
    required this.phoneNumber,
    required this.accessTokens,
  });

  FirebaseUser copyWith({
    String? email,
    String? username,
    String? profilePicUrl,
    String? phoneNumber,
    List<String>? posts,
    List<String>? drafts,
    Map<String, dynamic>? accessTokens,
  }) {
    return FirebaseUser(
      email: email ?? this.email,
      username: username ?? this.username,
      profilePicUrl: profilePicUrl ?? this.profilePicUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      accessTokens: accessTokens ?? this.accessTokens,
    );
  }

  factory FirebaseUser.zero({
    String? email,
    String? username,
    String? profilePicUrl,
    String? phoneNumber,
    List<String>? posts,
    List<String>? drafts,
  }) {
    return FirebaseUser(
      email: email ?? 'defaultEmail',
      username: username ?? 'defaultUsername',
      profilePicUrl: profilePicUrl ?? 'avatar.png',
      phoneNumber: phoneNumber ?? 'defaultPhoneNumber',
      accessTokens: {},
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'username': username,
      'profilePicUrl': profilePicUrl,
      'phoneNumber': phoneNumber,
      'accessTokens': accessTokens,
    };
  }

  factory FirebaseUser.fromMap(Map<String, dynamic> map) {
    return FirebaseUser(
      email: map['email'] ?? '',
      username: map['username'] ?? '',
      profilePicUrl: map['profilePicUrl'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      accessTokens: Map<String, dynamic>.from(map['accessTokens']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FirebaseUser.fromJson(String source) =>
      FirebaseUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FirebaseUser(email: $email, username: $username, profilePicUrl: $profilePicUrl, phoneNumber: $phoneNumber, accessTokens: $accessTokens)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FirebaseUser &&
        other.email == email &&
        other.username == username &&
        other.profilePicUrl == profilePicUrl &&
        other.phoneNumber == phoneNumber &&
        mapEquals(other.accessTokens, accessTokens);
  }

  @override
  int get hashCode {
    return email.hashCode ^
        username.hashCode ^
        profilePicUrl.hashCode ^
        phoneNumber.hashCode ^
        accessTokens.hashCode;
  }
}
