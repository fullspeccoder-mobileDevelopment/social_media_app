import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:twitter_oauth2_pkce/twitter_oauth2_pkce.dart';
// ignore: implementation_imports
import 'package:twitter_oauth2_pkce/src/scope.dart' as s;

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

  LocalUser copyWith({
    String? id,
    FirebaseUser? user,
  }) {
    return LocalUser(
      id: id ?? this.id,
      user: user ?? this.user,
    );
  }
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
              accessTokens: {},
            ),
          ),
        );
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  final oauth2 = TwitterOAuth2Client(
    clientId: 'bnZ6U1ZBZmo5SkRkVmpIZGN5Rmg6MTpjaQ',
    clientSecret: 'xysW2BDg0wXtDWbTd_HTb6HSiAEGYoui1vP07H1VAVjnJtJbKP',
    redirectUri: 'com.crossmedia.oauth://callback/',
    customUriScheme: 'com.crossmedia.oauth',
  );

  Future<void> logIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
    QuerySnapshot response =
        await _store.collection("users").where('email', isEqualTo: email).get();
    if (response.docs.isEmpty) {
      print("No firestore user associated to authenticated email $email");
      return;
    }
    if (response.docs.length != 1) {
      print("More than one firestore user associate with email: $email");
      return;
    }
    state = LocalUser(
        id: response.docs[0].id,
        user: FirebaseUser.fromMap(
            response.docs[0].data() as Map<String, dynamic>));
  }

  Future<void> logInWithTwitter() async {
    final DocumentReference docRef = _store.collection("users").doc(state.id);

    final response = await oauth2.executeAuthCodeFlowWithPKCE(
      scopes: [
        s.Scope.usersRead,
        s.Scope.tweetRead,
        s.Scope.tweetWrite,
      ],
    );

    _store.runTransaction((transaction) async {
      transaction.update(docRef, {
        'accessTokens': {"twitter": response.accessToken}
      });
    });

    state = state.copyWith(
      user: state.user.copyWith(
        accessTokens: {
          ...state.user.accessTokens,
          'twitter': response.accessToken
        },
      ),
    );
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
            accessTokens: {},
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
        accessTokens: {},
      ),
    );
  }
}
