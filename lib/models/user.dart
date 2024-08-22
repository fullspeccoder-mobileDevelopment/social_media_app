// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LocalUser {
  final String email;
  final String id;

  const LocalUser({
    required this.email,
    required this.id,
  });

  LocalUser copyWith({
    String? email,
    String? id,
  }) {
    return LocalUser(
      email: email ?? this.email,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'id': id,
    };
  }

  factory LocalUser.fromMap(Map<String, dynamic> map) {
    return LocalUser(
      email: map['email'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalUser.fromJson(String source) =>
      LocalUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LocalUser(email: $email, id: $id)';

  @override
  bool operator ==(covariant LocalUser other) {
    if (identical(this, other)) return true;

    return other.email == email && other.id == id;
  }

  @override
  int get hashCode => email.hashCode ^ id.hashCode;
}
