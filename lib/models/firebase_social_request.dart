import 'dart:convert';

class FirebaseSocialRequest {
  final String name;
  final String link;

  FirebaseSocialRequest({required this.name, required this.link});

  FirebaseSocialRequest copyWith({
    String? name,
    String? link,
  }) {
    return FirebaseSocialRequest(
      name: name ?? this.name,
      link: link ?? this.link,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'link': link,
    };
  }

  factory FirebaseSocialRequest.fromMap(Map<String, dynamic> map) {
    return FirebaseSocialRequest(
      name: map['name'] ?? '',
      link: map['link'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FirebaseSocialRequest.fromJson(String source) =>
      FirebaseSocialRequest.fromMap(json.decode(source));
}
