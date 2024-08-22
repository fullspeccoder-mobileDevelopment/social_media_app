import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:untitled_app/models/firebase_user.dart';
import 'package:untitled_app/models/post.dart';

final userProvider = StateNotifierProvider<UserNotifier, LocalUser>((ref) {
  return UserNotifier();
});

class LocalUser {
  final String id;
  final FirebaseUser user;

  LocalUser({
    required this.id,
    required this.user,
  });
}

class UserNotifier extends StateNotifier<LocalUser> {
  UserNotifier()
      : super(
          LocalUser(
            id: "N/A",
            user: const FirebaseUser(
              email: "N/A",
              username: "N/A",
              profilePicUrl: "N/A",
              posts: [],
            ),
          ),
        );
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<void> logIn(String email, String password) async {
    final userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    state = LocalUser(
      id: userCredential.user!.uid,
      user: const FirebaseUser(
        email: "N/A",
        username: "N/A",
        profilePicUrl: "N/A",
        posts: [],
      ),
    );
  }

  Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final docReference = await _store.collection('users').add(
          FirebaseUser(
            email: email,
            username: "No Name",
            profilePicUrl: "",
            posts: [],
          ).toMap(),
        );

    final docSnapshot = await docReference.get();
    state = LocalUser(
      id: docReference.id,
      user: FirebaseUser.fromMap(docSnapshot.data() as Map<String, dynamic>),
    );
  }

  Future<void> signOut() async {
    await _auth.signOut();

    state = LocalUser(
      id: 'N/A',
      user: const FirebaseUser(
        email: "N/A",
        username: "N/A",
        profilePicUrl: "N/A",
        posts: [],
      ),
    );
  }
}
