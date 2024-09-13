import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled_app/models/firebase_social_request.dart';

class SocialRequest {
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<void> sendRequest(String name, String link) async {
    await _store.collection("social-requests").add(
          FirebaseSocialRequest(
            name: name,
            link: link,
          ).toMap(),
        );
  }
}
