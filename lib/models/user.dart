// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LocalUser {
  final String email;

  const LocalUser({
    required this.email,
  });

  LocalUser copyWith({
    String? email,
  }) {
    return LocalUser(
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
    };
  }

  factory LocalUser.fromMap(Map<String, dynamic> map) {
    return LocalUser(
      email: map['email'] ?? "someemail@gmail.com",
    );
  }

  String toJson() => json.encode(toMap());

  factory LocalUser.fromJson(String source) =>
      LocalUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LocalUser(email: $email)';

  @override
  bool operator ==(covariant LocalUser other) {
    if (identical(this, other)) return true;

    return other.email == email;
  }

  @override
  int get hashCode => email.hashCode;
}
