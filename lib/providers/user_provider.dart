import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:untitled_app/models/firebase_user.dart';

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
            id: "",
            user: const FirebaseUser(
              email: "",
              username: "",
              profilePicUrl: "",
              posts: [],
            ),
          ),
        );
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;

  Future<void> logIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);

    final QuerySnapshot querySnap = await _store.collection("users").get();
    final user = querySnap.docs[0];

    state = LocalUser(
        id: user.id,
        user: FirebaseUser.fromMap(user.data() as Map<String, dynamic>));
  }

  Future<void> signUp(String email, String password) async {
    await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    final AggregateQuerySnapshot snapshot =
        await _store.collection('users').count().get();
    final docReference = await _store.collection('users').add(
          FirebaseUser(
            email: email,
            username: "User${snapshot.count}",
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
      id: '',
      user: FirebaseUser(
        email: "",
        username: "",
        profilePicUrl: "",
        posts: state.user.posts,
      ),
    );
  }
}
